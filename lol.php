<?php

require __DIR__.'/vendor/autoload.php';

try{
	
	$db = new PDO('mysql:host=localhost;dbname=homework', 'root', '');
	
} catch(PDOException $e){
	
	echo "Error: Could not connect. " . $e->getMessage();
	
}

$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Установка error-режима

function get_text($id) {
		
	  $db = new PDO('mysql:host=localhost;dbname=homework', 'root', '');
	  $sql = "SELECT * FROM `images` WHERE name='{$id}.jpg'";  // 
      $sth = $db->query($sql);
       while ($row = $sth->fetchObject()) {
         $data[] = $row;
         }
	$lol = array_column($data, 'name'); // Преобразовываем объект stdClass в массив 
	foreach($lol as $key => $value){
		$img = $value;
	}
	
    unset($db); 
	
	return $img;
	}

try {

	if($_GET['id']) {
	$id = (int)$_GET['id'];
	$result = get_text($id);
     }
	
	$loader = new Twig_Loader_Filesystem('templates'); //Путь к шаблонам 
	
	$twig = new Twig_Environment($loader); //Инициализация Твига
	
	$template = $twig->loadTemplate('imageBig.tmpl'); //Подгружаем шаблон
	

  echo $template->render(array(
    'item' => $result
  ));
	
 } catch (Exception $e) {
  die ('ERROR: ' . $e->getMessage());
}


