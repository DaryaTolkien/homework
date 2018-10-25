<?php

class Foundation_cream extends Cosmetics{ //подкласс тонального крема
	
	private $properties; //покрытие тонального крема
	
	function __construct($name, $price, $color, $properties){
		parent::__construct($name, $price, $color);
		$this->properties = $properties;
    }
	
	function to_show(){
		echo "Тональное средство {$this->name} имеет {$this->color} цвет и {$this->properties} покрытие." . "<br>" . "Цена: {$this->price} рублей.<hr>";
	}
}

$dior = new Foundation_cream('Dior', '3500', 'светлый', 'матовое');
$dior->to_show();

$clarins = new Foundation_cream('Clarins', '2000', 'тёмный беж', 'сияющее');
$clarins->to_show();