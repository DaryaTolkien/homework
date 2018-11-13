<?php

class Catalog extends Model {
	
    protected static $table = 'catalogs';
	
	 protected static function setProperties()
    {
        self::$properties['title'] = [
            'type' => 'varchar',
            'size' => 255
        ];

        self::$properties['price'] = [
            'type' => 'int',
        ];
    }

    public static function getCatalog()
    {
        return db::getInstance()->Select(
            'SELECT * FROM catalog');
    }
}