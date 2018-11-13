<?php

class Basket extends Model{
	
	protected static $table = 'basket';
	
	   protected static function setProperties()
    {
        self::$properties['amount'] = [
            'type' => 'string',
            'size' => 3
        ];
    }
	
	public static function setBasket($id, $session){ //Добавим товары в корзину
		
		header("location: /");
		
		return db::getInstance()->Select(
            "INSERT INTO basket (id_good, user) VALUES ('$id', '$session')");
	}
	
    public static function deleteBasket($idx){ //Удалить товары из корзины
		
	     header("location: /basket/");
		
		 return db::getInstance()->Select(
			 "DELETE FROM `basket` WHERE idx = $idx");
		 
    }
	
	public static function getBasket($session){ //Вывести товары из корзины
		
        return db::getInstance()->Select(
            "SELECT * FROM basket INNER JOIN catalog ON basket.id_good = catalog.id WHERE `user` = '$session' ORDER BY pubdate DESC");
    }
	
	public static function getCount(){ //Выводит сумму и количество товаров в корзине
		
		return db::getInstance()->Select(
		"SELECT SUM( `price` ) as amount,COUNT( `idx` ) as count FROM basket INNER JOIN catalog ON basket.id_good = catalog.id");
	}
	
	public static function checkOrder($name, $tel, $address, $session){ //Отправляет заказы в админ панель
		header("location: /basket/success/");
		return db::getInstance()->Select(
		"INSERT INTO users_shop (name, address, tel, users) VALUES ('$name', '$address', '$tel', '$session')");
	}
	
	public static function succesBasket(){
		unset($_SESSION);
		header("location: /");
	}
	
}









