<?php

class Mascara extends Cosmetics{ //подкласс туши для ресниц
	
	private $long; //длина туши
	
	function __construct($name, $color, $price, $long){
		parent::__construct($name, $color, $price);
		$this->long = $long;
	}
	
	function to_show(){
		echo "Тушь {$this->name} имеет {$this->color} цвет и {$this->long} длину." . "<br>" . "Цена: {$this->price} рублей.<hr>";
	}
}

$helena_rubinstein = new Mascara('Helena Rubinstein', '2500', 'чёрный', 'ультра');
$helena_rubinstein->to_show();

$giorgio_armani = new Mascara('Giorgio Armani', '2100', 'серый', 'небольшую');
$giorgio_armani->to_show();