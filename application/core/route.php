<?php

Class Route{
	
	static function start(){
		// контроллер и действие по умолчанию
		$controller_name = 'Main';
		$action_name = 'index';
		
		$routes = explode('/', $_SERVER['REQUEST_URI']); //содержится полный адрес по которому обратился пользователь. Например: example.ru/contacts/feedback
		
		// получаем имя контроллера
		if(!empty($routes[1])){
			$controller_name = $routes[1];
		}
		
		// получаем имя action
		if(!empty($routes[2])){
			$action_name = $routes[2];
		}
		
		// добавляем префиксы
		$model_name = 'Model_' . $controller_name;
		$controller_name = 'Controller_' . $controller_name;
		$action_name = 'action_' . $action_name;
		
		// подцепляем файл с классом модели (файла модели может и не быть)
		$model_file = strtolower($model_name) . '.php'; // херачит например главный model_main.php
		$model_patch = 'application/models/' . $model_file; //херачит полный путь до моделиБ например application/models/model_main.php
		if(file_exists($model_patch)){
			include "application/models/" . $model_file;
		}
		
		// подцепляем файл с классом контроллера
		$controller_file = strtolower($controller_name) . '.php'; 
		$controller_path = "application/controllers/" . $controller_file; // Исполнит application/controllers/controller.php
		if(file_exists($controller_path))
		{
			include "application/controllers/" . $controller_file;
		}
		else
		{
			Route::ErrorPage404(); //Переадресовываем на ошибку 404
		}
		
		// создаем контроллер
		$controller = new $controller_name;
		$action = $action_name;
		
		if(method_exists($controller, $action))
		{
			$controller->$action(); // вызываем действие контроллера
		}
		else
		{
			Route::ErrorPage404(); // Можно так же вызвать исключение
		}
		
	}
	
	function ErrorPage404(){
		$host = 'http://'.$_SERVER['HTTP_HOST'].'/';
        header('HTTP/1.1 404 Not Found');
		header("Status: 404 Not Found");
		header('Location:'.$host.'404');
	}
}

















