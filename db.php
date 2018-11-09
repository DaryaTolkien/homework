<?php


define('DB_HOST', 'localhost');
define('DB_NAME', 'test_pdo');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_CHAR', 'utf8');

class DB
{
    protected static $instance = null;

    public function __construct() {}
    public function __clone() {}

    public static function instance(){
        if (self::$instance === null){
         
            $dsn = 'mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset='.DB_CHAR;
            self::$instance = new PDO($dsn, DB_USER, DB_PASS);
        }
        return self::$instance;
    }
 

    public static function run($sql, $args){
		
        $stmt = self::instance()->prepare($sql);
        $stmt->execute($args);
        //return $stmt;
		return $stmt;        
    }
}






 