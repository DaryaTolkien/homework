<?php

class Admin extends Model{
	
	protected static $table = 'admin';
	
	
	public static function active($status){ //Вывести товары из корзины
		
       return db::getInstance()->Select(
        "SELECT * FROM basket INNER JOIN users_shop ON basket.user = users_shop.users WHERE `active` = '$status'");
    }
	
	public static function archiv($idx){
		
		return db::getInstance()->Select(
        "UPDATE basket SET active = '2' WHERE idx = $idx");
    }
	
	
	}
	