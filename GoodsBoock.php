-<?php

abstract class GoodsBoock{ //Основоной класс книг
	private $name; // Название книги
	private $price; // Цена книги
	
	function __construct($name, $price){
		$this->name = $name;
		$this->price = $price;
		$this->final_cost();
	}
	
	public function get_name(){
		return $this->name;
	}
	
	public function get_price(){
		return $this->price;
	}
	
	abstract protected function final_cost();
}




class DigitalProduct extends GoodsBoock{ // Класс электронных книг
	
	const DIGITAL_BOOCK = 'Электронная книга';
	
	public static $final = 0;
	
	function lol($per){ //Если существует передаваемый объект (из класса поштучных книг), то берем его имя и стоимость, которую делим на два
		if(isset($per)){
			$per = new self($per->get_name(), $per->get_price());
			$per->show();
		}
	}
	
	function show(){
		$price_digital = $this->get_price();
		echo 'Название: ' . $this->get_name() . '</br>';
		echo 'Цена: ' . $price_digital / 2 . '</br>';
		echo 'Категория: ' . self::DIGITAL_BOOCK . '</br></br>';
		self::$final + $this->get_price();
		
		//self::final_cost();
	}
	
	function final_cost(){
		echo self::$final;
	}
}
	

class PieceGoods extends GoodsBoock{ // Класс поштучных книг
	
	const PIECE_BOOCK = 'Поштучный товар';
	
	public $final = 0;
	
	function show($per, $count){
		echo 'Название: ' . $this->get_name() . '</br>';
		echo 'Цена: ' . $this->get_price() . '</br>';
		echo 'Категория: ' . self::PIECE_BOOCK . '</br></br>';
		
		self::set_DigitalProduct($per); //Вызываем методы для создание объектов цифорвых книг и книг на развес
		self::set_WeighingGoods($per, $count);
		self::final_cost();
	}
	
	
	function set_DigitalProduct($per){ //Каждый раз, когда создается объект класса поштучных книг, автоматически создаются объекты электронных книг, и книг на развес, с учетом особенностей их стоимости 
		DigitalProduct::lol($per);
	}
	
	function set_WeighingGoods($per, $count){
		WeighingGoods::lol($per, $count);
	}
	
	function final_cost(){
		
	}
}



class WeighingGoods extends GoodsBoock{ // Класс книг на развес
	
	const WEIGHING_BOOCK = 'Книги на развес';
	
	function lol($per, $count){ //Если существует передаваемый объект (из класса поштучных книг), то берем его имя и стоимость, которую высчитываем из переданых килограммов
		if(isset($per)){
			$per = new self($per->get_name(), $per->get_price());
			$per->show($count);
		}
	}
	
	function show($count){
		$price_digital = $this->get_price();
		echo 'Название: ' . $this->get_name() . '</br>';
		echo 'Цена: ' . round($price_digital / 3 * $count) . '</br>';
		echo 'Категория: ' . self::WEIGHING_BOOCK . '</br></br>';
	}
	
	function final_cost(){
	}
	
}

$Cindrella = new PieceGoods('Золушка', 200); // создаем книгу Золушка
$Cindrella->show($Cindrella, 2);

$Master = new PieceGoods('Мастер и Маргарита', 350); // создаем книгу Мастер и Маргарита
$Master->show($Master, 3);



















