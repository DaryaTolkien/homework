<?php

class Lipstick extends Cosmetics{ //подкласс помад
	
	private $texture; //текстура помады
	
	function __construct($name, $color, $price, $texture){
		parent::__construct($name, $color, $price);
		$this->texture = $texture;
	}
	
	function to_show(){
		echo "Помада {$this->name} имеет {$this->color} цвет и {$this->texture} текстуру." . "<br>" . "Цена: {$this->price} рублей.<hr>";
	}
}

$chanel = new Lipstick('Shanel', '2300', 'красный', 'глянцевую');
$chanel->to_show();

$tom_ford = new Lipstick('Tom Ford', '4000', 'розовый', 'блестящую');
$tom_ford->to_show();