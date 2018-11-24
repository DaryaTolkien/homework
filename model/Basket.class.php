<?php

class Basket extends Model{
	
	protected static $table = 'basket';
	
	public static function setBasket($id, $session){ //Добавим товары в корзину
		
		//header("location: /");
		
		return db::getInstance()->Select(
            "INSERT INTO basket (id_good, user) VALUES ('$id', '$session')");
	}
	
	public static function selectCount($id, $session){ //Проверяем не был ли уже добавлен тот же товар (подсчёт кол-ва)
		
		return db::getInstance()->Select(
            "SELECT * FROM basket WHERE `user` = '$session' AND `id_good` = $id AND active=1");
	}
	
	public static function setCount($id, $session){ //Если товар уже есть, то добавляем count + 1
		//header("location: /");
		return db::getInstance()->Select(
            "UPDATE `basket` SET `count`= `count`+1 WHERE id_good={$id} AND active=1 AND user='{$session}'");
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
	
	
	public static function getCount($session = ''){ //Выводит сумму и количество товаров в корзине
		
		return db::getInstance()->Select(
		"SELECT SUM( `price`*`count` ) as amount,SUM( `count` ) as count FROM basket INNER JOIN catalog ON basket.id_good = catalog.id WHERE `user` = '$session'");
	}
	
	public static function checkOrder($name, $tel, $address, $session){ //Отправляет заказы в админ панель
		header("location: /basket/success/");
		return db::getInstance()->Select(
		"INSERT INTO users_shop (name, address, tel, users) VALUES ('$name', '$address', '$tel', '$session')");
	}
	
	public static function succesBasket(){
		session_regenerate_id();
		header("location: /");
	}
	
}









