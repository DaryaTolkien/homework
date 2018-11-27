<?php

class LoginController extends Controller{
	
	function __construct()
    {
        parent::__construct();
        $this->title .= ' | Вход';
    }
	
    public $view = 'login';
	public $action;
	public $log; //Если никто не залогинен то выводим блок входа или регистрации
	
	 public function index($data) {
		 
		 if(empty($_SESSION['session_login'])){ //Если не вошел в систему, то доступ закрыт, и подключается блок регистрации или вохода
			 $this->log = 'no';
		 }
		 if(isset($_SESSION['session_login'])){ //Если уже вошел, то генерируем личный аккаунт
			 $this->log = 'yes';
			 $this->action = Login::isUser($_SESSION['session_login'], $_SESSION['session_password']);
		 }
		 
        if(isset($_POST['log'])){ // Проверка на логин или пароль, админ или просто юзер
			$name = strip_tags($_POST['login']);
			$name = htmlspecialchars($name);
			
			$password = strip_tags($_POST['password']);
			$password = htmlspecialchars($password);
			$pass = md5($password);
			
			if(Login::isAdmin($name, $password) == true){ //Если логин и пароль админа, то заходим в админ панель
				$_SESSION['admin'] = $name;
				Login::verifyAdmin();
				
			} elseif(Login::isUser($name, $pass) == true){ //Если логин и пароль юзера, то заходим в личный кабинет
				$this->log = 'yes';
				$_SESSION['session_login'] = $name;
				$_SESSION['session_password'] = $pass;		
				$this->action = Login::isUser($_SESSION['session_login'], $_SESSION['session_password']);
			} else { 
				$this->action = "Your password and email do not match. Please try again ";
			}
		}
		 
		 if(isset($_POST['creat'])){ // Регистрируем пользователя
			$login = strip_tags($_POST['login']);
			$login = htmlspecialchars($login);
			 
			$name = strip_tags($_POST['name']);
			$name = htmlspecialchars($name);
			 
			$password = strip_tags($_POST['password']);
			$password = htmlspecialchars($password);
			$password = md5($password);
			 
			 if(Login::setUser($login, $name, $password) == false){
				 $_SESSION['session_login'] = $name;
				 $_SESSION['session_password'] = $password;
				 $this->action = Login::isUser($_SESSION['session_login'], $_SESSION['session_password']);
				 $this->log = 'yes';
			 } else {
				 $this->action = "herna!";
			 }
		 }
		 
		 if(isset($_GET['loggout'])){ //Если нажата кнпока выйти, то удаляем сессию
			     unset($_SESSION['session_login']);
			     header("location: /login/");
		 }
		 //var_dump($this->action);
        return ['login' => $this->action, 'status' => $this->log];
    }
}






















