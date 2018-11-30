<?php

class BasketController extends Controller{
	
	function __construct()
    {
        parent::__construct();
        $this->title .= ' | Корзина';
    }
	
	public $view = 'basket';

	public function index($data){
		
		if($_POST['add_id']){  //Заносим значения в корзину 
			if(Basket::selectCount($_POST['add_id'], session_id())){ //Проверяем, на кол-во товара в коризне
				Basket::setCount($_POST['add_id'], session_id()); //Если есть такой же товар, то count + 1
				$json_add_count = Basket::getCount(session_id());
				exit(json_encode($json_add_count));
			} else {
			       Basket::setBasket($_POST['add_id'], session_id());
				   $json_add = Basket::getCount(session_id());
				   exit(json_encode($json_add));
				}
	   } else {
			$count = Basket::getCount(session_id()); 
		}
		
		
		if(isset($_GET['del'])){ //Удаляем книги из корзины
			$delete = Basket::deleteBasket($_GET['del']);
		}
		
		if(isset($_POST['check'])){ //Оформление заказа
			$name = $_POST['name'];
			$tel = $_POST['tel'];
			$address = $_POST['address'];
			$checkout = Basket::checkOrder($name, $tel, $address, session_id());
		}
		
		if(isset($_GET['value'])){
			Basket::succesBasket();
		}
		
        $basket = Basket::getBasket(session_id());
        return ['basket' => $basket, 'count' => $count, 'sess' => $_SESSION];
	}
	
	public function success($data){
		
		$count = Basket::getCount(); 
		return ['count' => $count];
	}
	
}