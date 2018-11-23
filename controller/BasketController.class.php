<?php

class BasketController extends Controller{
	
	function __construct()
    {
        parent::__construct();
        $this->title .= ' | Корзина';
    }
	
	public $view = 'basket';

	public function index($data){
		
		if(isset($_POST['getgood'])){ //Заносим значения в корзину с главной страницы
			if(Basket::selectCount($_POST['id'], session_id())){
				Basket::setCount($_POST['id'], session_id());
			} else {
			        $baskets = Basket::setBasket($_POST['id'], session_id());
				}
		} 
		
		if(isset($_GET['getgood'])){  //Заносим значения в корзину со ссылки с подробным описанием товара
			
			$baskets = Basket::setBasket($_GET['getgood'], session_id());
		}
		
		
		if(isset($_GET['del'])){ //Удаляем книги из корзины
			$delete = Basket::deleteBasket($_GET['del']);
		}
		
		if(isset($_POST['check'])){
			$name = $_POST['name'];
			$tel = $_POST['tel'];
			$address = $_POST['address'];
			$checkout = Basket::checkOrder($name, $tel, $address, session_id());
		}
		
		if(isset($_GET['value'])){
			Basket::succesBasket();
		}
		
		$count = Basket::getCount(session_id()); 
        $basket = Basket::getBasket(session_id());
        return ['basket' => $basket, 'count' => $count];
	}
	
	public function success($data){
		
		$count = Basket::getCount(); 
		return ['count' => $count];
	}
	
}