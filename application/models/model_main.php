<?php

Class Model_Main extends Model{
	
	function get_data(){
		

		if(isset($_POST['submit']))
		{
			$login = $_POST['name'];
			$password = $_POST['password'];
			$password = $password;
			
			//$name = DB::run("SELECT * FROM users WHERE name = :login AND password = :password", array('name' => $login, 'password' => 2311));
			
			$sql = "SELECT * FROM users WHERE name = '$login' AND password = $password";
			
			$name = DB::instance()->prepare($sql);
			//$name->bindParam(':login', $login);  НЕ ПОДСТАВЛЯЕТ ЗНАЧЕНИЯ
            //$name->bindParam(':password', $password);
			$name->execute();
			
			if(!$name){ //Проверка на соединение 
				$data = 'Ошибка запроса';
			} else {
				$lol = $name->fetchAll();
			    if($lol){ //Проверка пароля
					Session::init();
                    Session::set('loggedIn', true);
					//session_start();
                    header('Location: /cabinet/');
				} else {
					$data = 'Неправильный пароль';
				}
			}
			return $data;
		}
	}
   
}