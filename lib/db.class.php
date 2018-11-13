<?php


class db{
	
	const DB_HOST = 'localhost';
    const DB_NAME = 'php3';
    const DB_USER = 'root';
    const DB_PASS = '';
    const DB_CHAR = 'utf8';
	
    private static $_instance = null;

    private $db; // Ресурс работы с БД

    /*
     * Получаем объект для работы с БД
     */
    public static function getInstance()
    {
        if (self::$_instance == null) {
            self::$_instance = new db();
        }
        return self::$_instance;
    }
    /*
     * Запрещаем копировать объект
     */
    private function __construct() {}
    private function __sleep() {}
    private function __wakeup() {}
    private function __clone() {}

    /*
     * Выполняем соединение с базой данных
     */
    public function Connect($user, $password, $base, $host = 'localhost', $port = 3306)
    {
        // Формируем строку соединения с сервером
        $connectString = 'mysql:host=' . $host . ';port= ' . $port . ';dbname=' . $base . ';charset=UTF8;';
        $this->db = new PDO($connectString, $user, $password,
            [
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC // возвращать ассоциативные массивы
               // PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION // возвращать Exception в случае ошибки
            ]
        );
    }

    /*
     * Выполнить запрос к БД
     */
    public function Query($query, $params = array())
    {
        $res = $this->db->prepare($query);
        $res->execute($params);
        return $res;
    }

    /*
     * Выполнить запрос с выборкой данных
     */
    public function Select($query, $params = array())
    {
        $result = $this->Query($query, $params);
        if ($result) {
            return $result->fetchAll();
        }
    }
	
	public static function getRow($query, $params = []) {
        return self::query($query, $params)->fetch();
    }

    /**
     * 
     * @param string $sql
     * @param array $args
     * @return integer ID
     */
    public static function insert($query, $params = []) {
        self::query($query, $params);
        return self::connect()->lastInsertId();
    }

    /**
     * 
     * @param string $sql
     * @param array $args
     * @return integer affected rows
     */
    public static function update($query, $params = []) {
        $stmt = self::query($query, $params);
        return $stmt->rowCount();
    }

    /**
     * 
     * @param string $sql
     * @param array $args
     * @return integer affected rows
     */
    public static function delete($query, $params = []) {
        $stmt = self::qury($query, $params);
        return $stmt->rowCount();
    }
	
	
	
	
	
	
	
	
	
	
}

