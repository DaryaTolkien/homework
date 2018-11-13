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
		
		if(isset($_POST['del'])){
			$idx = $_POST['idx'];
		    $id_good = $_POST['id_good'];
		    $name = $_POST['name'];
		    $address = $_POST['address'];
		    $tel = $_POST['tel'];
			Admin::tranzaction($idx, $id_good, $name, $address, $tel);
		}
	
		$active = Admin::active();
        return ['active' => $active];
	}
	
}