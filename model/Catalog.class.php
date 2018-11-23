<?php

class Catalog extends Model {
	
    protected static $table = 'catalogs';
	
	
    public static function getCatalog() {
        return db::getInstance()->Select(
            'SELECT * FROM catalog INNER JOIN catalog_author ON catalog.auhtor = catalog_author.id_auhtor');
    }
	
	public static function getAuhtor(){
        return db::getInstance()->Select(
            'SELECT * FROM `catalog_author`');
    }
	
	public static function SelectAuhtor($id){
        return db::getInstance()->Select(
            "SELECT * FROM catalog INNER JOIN catalog_author ON catalog.auhtor = catalog_author.id_auhtor WHERE id_auhtor = $id");
    }
	
}