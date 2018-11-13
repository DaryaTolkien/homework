<?php

class Good extends Model {
    protected static $table = 'goods';

    protected static function setProperties()
    {
        self::$properties['title'] = [
            'type' => 'varchar',
            'size' => 512
        ];

        self::$properties['price'] = [
            'type' => 'float'
        ];

    }
	
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