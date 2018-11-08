<?php

//Константы ошибок
define('ERROR_NOT_FOUND', 1);
define('ERROR_TEMPLATE_EMPTY', 2);

/*
  Подготовка переменных для разных страниц
  @param $page_name
  @return array
*/

function prepareVariables($page_name, $action = ""){
    $vars = [
		"title" => SITE_TITLE,
        "logout" => ""
	];
	
	//Блок нужный для авторизации и запоминания пользователя(сесии)
	if(isset($_SESSION['user'])) {
       $vars["logout"] = renderPage("logout_block");
     }
    else{
       $vars["logout"] = renderPage("login_block");
    }
    //Начало роутера
    switch ($page_name){
			
		case "index":
			$vars["content"] = get_content();
			$vars["basket"] = prepareBasketBlock(session_id());
			$vars["more"] = '';

			
			//if(isset($_POST['count_add']) && isset($_POST["count_show"])){
			  $countView = (int)$_POST['count_add'];  // количество записей, получаемых за один раз
              $startIndex = (int)$_POST['count_show']; // с какой записи начать выборку
			  $vars["more"] = get_more($startIndex, $countView);
			  $html = 'lol';
			print_r($countView);
				if(empty($html)){// если новостей нет
                echo json_encode(array(
                result => 'finish'
                  )); } 
				else {
			  $html = 'TEST';
		      echo json_encode(array(
              'result'  => 'success',
		       'html' => $html
                 ));
              } 
			//}
			
			
			break;
		case "login":
			 // если уже залогинен, то выбрасываем на главную
			if(alreadyLoggedIn()){
                header("Location: /");
            }
			 // если есть куки, то авторизуем сразу
            if(checkAuthWithCookie()){
                header("Location: /");
            }
			if(!empty($_POST['name']) && !empty($_POST["password"])){
			   if(vhodadmin() == 1){
				 header("Location: /adminka/");
				 } else{
				   header("Location: /");
				   }	      
				 } else {
				   header("Location: /");
			   }				    				  
            break;	
			
		case "ajax": //Подгрузка каталога по кнопке "еще"
			
			break;
			
			
		case "good": //блок вывода товара с определенным id
			$good = $_GET["id"];
			print_r($good); die();
		    break;
		case "getgood":
			////Кнопка купить - Добавление сессии и id товара в бд'
			if(isset($_GET['getgood']) && isset($_GET["id"])){
				saveGood($_GET["id"], session_id(), $_GET["price"]);
				header("Location: /");
			} else {
			    echo "Дерьмо случается";
			}
			break;
		case "basket":
			//Страницы корзины
			$vars["title"] = "Корзина";
			$vars["table"] = get_table(session_id());
            break;
		case "delete": //блок удаления из корзины 
			delete($_GET['idx']);
			header("location: /basket/");
			break;
		case "zakaz":
			if(isset($_POST['zakaz'])){
			  saveZakaz($_POST['name'], $_POST['phone'], $_POST['adres'], session_id());
			  header("location: /");
			  unset($_SESSION['name']);
			  session_destroy();
			}
			break;
		case "logout": //блок выхода из сессии
            unset($_SESSION["user"]);
            session_destroy();
            header("Location: /");
            break;
		case "adminka": //блок админки
			$vars["title"] = "Заказы покупателей";
			$vars["header"] = get_menu();
			$vars["table"] = get_zakaz();
		    prepareCabinet();
			break;
		case "done":
			$id = $_GET['idx'];
			done($id);
			header("location: /adminka/");
			break;
	//возвращаем готовый массив значения vars для шаблона 
	}
	// генерируем переменные для статических блоков
	$clear_vars = $vars;
	$clear_vars["main_menu"] = get_menu();
	

    $vars["header"] = renderPage("header_block", $clear_vars);
    $vars["footer"] = renderPage("footer_block", $clear_vars);
	
    return $vars;
	}


//Функция вывода каталога по кнопке "Еще"
function get_more($start, $end){
	$sql = "SELECT * FROM `catalog` LIMIT {$start}, {$end}";
    $count = getAssocResult($sql);
	return $count;
        }

//Функция вывода всех заказов в админ панели
function get_zakaz(){
    $sql = "SELECT * FROM `basket`,`users_shop` WHERE basket.user=users_shop.users ORDER BY id_good";
    $com = getAssocResult($sql);
    return $com;
		 }
			   
//Функция вывода каталога 
    function get_content(){
    $sql = "SELECT * FROM `catalog` LIMIT 10";
    $cont = getAssocResult($sql);
    return $cont;
      }

//функция возвращения меню
    
    function get_menu(){
	$sql = "SELECT * FROM `menu`";
	$header = getAssocResult($sql);
	return $header;
	}












