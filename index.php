<?php

require __DIR__.'/vendor/autoload.php';

try{
	
	$db = new PDO('mysql:host=localhost;dbname=homework', 'root', '');
	
} catch(PDOException $e){
	
	echo "Error: Could not connect. " . $e->getMessage();
	
}

$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Установка error-режима

try {

  $sql = "SELECT * FROM `images` ORDER BY name";  // 
  $sth = $db->query($sql);
  while ($row = $sth->fetchObject()) {
    $data[] = $row;
  }
	$lol = array_column($data, 'name'); // Преобразовываем объект stdClass в массив 
	
    unset($db); // Закрываем соединение

	$loader = new Twig_Loader_Filesystem('templates'); //Путь к шаблонам 
	
	$twig = new Twig_Environment($loader); //Инициализация Твига
	
	$template = $twig->loadTemplate('imageSmall.tmpl'); //Подгружаем шаблон
	

  echo $template->render(array(
    'data' => $lol
  ));

	
 } catch (Exception $e) {
  die ('ERROR: ' . $e->getMessage());
}












