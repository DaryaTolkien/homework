<?php

class Login extends Model {
    protected static $table = 'login';

	
	public static function isAdmin($name, $password) //Проверка на админа
    {
		    return db::getInstance()->Select(
            "SELECT * FROM admins WHERE name = '$name' AND password = '$password'");
		
            
    }
	
		public static function isUser($name, $password) //Проверка на юзера
    {
             return db::getInstance()->Select(
            "SELECT * FROM users WHERE login = '$name' AND password = '$password'");
    }
	
		public static function setUser($login, $name, $password){ // Зарегистрируем юзера		
		return db::getInstance()->Select(
            "INSERT INTO users (login, password, name) VALUES ('$login', '$password', '$name')");
	}
	
		public static function verifyAdmin(){ //Вывести товары из корзины
		
		if(isset($_SESSION['admin'])){
			header("location: /admin/");
		} else {
			header("location: /login/");
	}
       
    }
}