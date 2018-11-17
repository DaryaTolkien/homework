<?php

class IndexController extends Controller{
	
    public $view = 'index';
    public $title;

    function __construct()
    {
        parent::__construct();
        $this->title .= ' | Главная';
    }
	
	
	public function index($data) {
		
	if($_POST['id_auhtor']){
		$id = (int)($_POST['id_auhtor']);
		$select_ajax = Catalog::SelectAuhtor($id);
		echo json_encode($select_ajax);
		
	} else {
		
		$select = Catalog::getAuhtor(); 
	}
		
	return ['get_auhtor' => $select];
		
	}
}
