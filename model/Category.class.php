<?php

class Category extends Model {
    protected static $table = 'categories';

    protected static function setProperties()
    {
        self::$properties['name'] = [
            'type' => 'varchar',
            'size' => 512
        ];
    }

    public static function getCategories()
    {
        return db::getInstance()->Select(
            'SELECT * FROM menu');
           // ,['status' => Status::Active, 'parent_id' => $parentId]);

    }
}