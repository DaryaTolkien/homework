<?php

Class Controller_main extends Controller{ //Класс клавной страницы
	
	
	function action_index(){
		
		$this->view->generate('main_view.php', 'template_view.php');
	}
	
}