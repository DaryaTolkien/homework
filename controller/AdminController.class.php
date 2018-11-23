<?php

class AdminController extends Controller{
	
	public $view = 'admin';
	
	public function index($data){
		
		if(empty($_SESSION['admin'])){
			header("location: /");
		} 
		
		if(isset($_GET['loggout'])){ //Если нажата кнпока выйти, то удаляем сессию
			     unset($_SESSION['admin']);
			     header("location: /");
		 }
		
		if(isset($_GET['archiv'])){
			$idx = $_GET['archiv'];
			Admin::archiv($idx);
		}
	
		$active = Admin::active(1);
		$archiv = Admin::active(2);
        return ['active' => $active, 'archiv' => $archiv];
	}
	
}