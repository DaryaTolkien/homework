<?php

class BasketController extends Controller{
	
	function __construct()
    {
        parent::__construct();
        $this->title .= ' | Корзина';
    }
	
	public $view = 'basket';

	public function index($data){
		
		if(isset($_GET['add_id'])){  //Заносим значения в корзину 
			if(Basket::selectCount($_GET['add_id'], session_id())){ //Проверяем, на кол-во товара в коризне
				Basket::setCount($_GET['add_id'], session_id()); //Если есть такой же товар, то count + 1
			} else {
			        $baskets = Basket::setBasket($_GET['add_id'], session_id());
				}
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
		
		$count = Basket::getCount(session_id()); 
        $basket = Basket::getBasket(session_id());
        return ['basket' => $basket, 'count' => $count];
	}
	
	public function success($data){
		
		$count = Basket::getCount(); 
		return ['count' => $count];
	}
	
}