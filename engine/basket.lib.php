<?php
//Блок корзины в шапке

function prepareBasketBlock($session){
    $basket_block = "";
    $basket_vars = [
            "goods" => 0,
            "amount" => 0
        ];

     $basket_data = getRowResult("SELECT COUNT(idx) AS goods, SUM(price) as amount FROM basket WHERE user = '{$session}'");

        if(isset($basket_data['goods'])){
            $basket_vars['goods'] = $basket_data['goods'];
            $basket_vars['amount'] = $basket_data['amount'];
        }
        $basket_block = renderPage("basket_block", $basket_vars);
    
    return $basket_block;
}

//Фунция ввода товара, сессии в БД
	function saveGood($good, $session, $price){
    $sql = "INSERT INTO `basket` (`id_good`, `user`, `price`) VALUES ('{$good}', '{$session}', '{$price}');";
	$bla = executeQuery($sql);
   } 



//Функция показа товаров в странице корзине 
    function get_table($session){
    $sql = "SELECT * FROM `basket`,`catalog` WHERE `user` = '{$session}' AND basket.id_good=catalog.id";
    $com = getAssocResult($sql);
    return $com;
		 }

//Функция удаления товара из корзины
   function delete($id){
	$sql = "DELETE FROM `basket` WHERE `basket`.`idx` = {$id}";
	executeQuery($sql);
   }

//Фунция оформление заказа в БД
   function saveZakaz($name, $phone, $adres, $session){
    $sql = "INSERT INTO `users_shop` (`name`, `tel`, `adres`, `users`) VALUES ('{$name}', '{$phone}', '{$adres}', '{$session}');";
	$bla = executeQuery($sql);
   }
