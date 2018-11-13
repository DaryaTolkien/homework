<?php

class Admin extends Model{
	
	protected static $table = 'admin';
	
	
	public static function active(){ //Вывести товары из корзины
		
       return db::getInstance()->Select(
        "SELECT * FROM basket INNER JOIN users_shop ON basket.user = users_shop.users");
    }
	//SELECT * FROM `basket`,`users_shop` WHERE basket.user=users_shop.users ORDER BY id_good
	
	public static function tranzaction($idx, $id_good, $name, $address, $tel){ //Функция удаления товара из активного состояния в архив
		
		//header("location: /admin/");
		
       $tr = db::getInstance()->connect('root', '', 'mvc');
       $tr->beginTransaction();
	   $tr->exec("DELETE FROM `basket` WHERE idx = $idx");
	   $tr->exec("INSERT INTO archiv (id_good, name, address, tel) VALUES ('$id_good', '$name', '$address', '$tel')");
       $tr->commit();
    }
}