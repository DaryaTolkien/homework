<?php
include 'Foundation_cream.php';
include 'Lipstick.php';
include 'Mascara.php';

class Cosmetics{ //Создаем класс косметики
	
	protected $name; 
	protected $price;
	protected $color;
	
	function __construct($name, $price, $color){
		$this->name = $name;
		$this->price = $price;
		$this->color = $color;
	}
	
	//я думаю в этом случае важно, что бы вызывающие функции были у каждого подкласса свои, ибо они несут в себе разную информацию.
}

