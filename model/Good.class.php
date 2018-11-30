<?php

class Good extends Model {
    protected static $table = 'goods';
	
	public static function getGoods($categoryId)
    {
        return db::getInstance()->Select(
            "SELECT * FROM catalog WHERE id = $categoryId");
    }
	
/*
    public static function getGoods($categoryId)
    {
        return db::getInstance()->Select(
            'SELECT * FROM category WHERE id = :category',
            ['category' => $categoryId]);
    }
*/
}