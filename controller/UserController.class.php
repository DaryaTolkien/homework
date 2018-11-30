<?php

class UserController extends Controller{
	
    public $view = 'user'; 
    public $title;

    function __construct()  
    {
        parent::__construct();
        $this->title .= ' | Личный кабинет';
    }
	
	
	public function index($data) {
		
		if(Login::isUser($_SESSION['session_login'], $_SESSION['session_password'])){ //Если уже вошел, то генерируем личный аккаунт
			  $user_block = Login::isUser($_SESSION['session_login'], $_SESSION['session_password']);
			  foreach($user_block as $key => $value){
				 $_SESSION['session_tel'] = $value['tel'];
				 $_SESSION['session_name'] = $value['name'];
				 $_SESSION['session_adres'] = $value['adres'];
			  }
		 } else {
			session_destroy();
			header("location: /login/");
		}
		
    if(isset($_POST['idfile'])){ //Блок изменения фото-аватарки 
		
		$files = $_FILES; // полученные файлы
		$id = $_POST['idfile'];
	 
		foreach( $files as $file ){
         $result = User::upload_file($file);
		}
		
         if(isset($result['error'])){
             $error = $result['error'];
         }else{
			  $img = $result['filename'];
          }
     if(!isset($error)){
            $update_img = User::UpdateImg($img, $id);
		    exit(json_encode($img));
     }else{
		    exit(json_encode($error));
     }
   }
	
	if(isset($_POST['text']) || isset($_POST['variable'])){
		$text = strip_tags($_POST['text']);
		$text = htmlspecialchars($text);
		
		$variable = strip_tags($_POST['variable']);
		$variable = htmlspecialchars($variable);
		
		$udateText = User::updateText($variable, $text, $_SESSION['session_login']);
	}
		return ['user_block' => $user_block];
	}
	
}
 
				
	
		
	


















