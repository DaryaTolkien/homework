<?php

Class Controller_main extends Controller{ //Класс клавной страницы
	
	function __construct(){
		$this->model = new Model_Main();
		$this->view = new View();
	}
	
	
	function action_index(){
		$data = $this->model->get_data();		
		$this->view->generate('main_view.php', 'template_view.php', $data);
	}
}
	