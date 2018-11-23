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
		
	if($_GET['id_auhtor']){
		$id = (int)($_GET['id_auhtor']);
		$select_ajax = Catalog::SelectAuhtor($id);
		//$json['catalog'] = $select_ajax;
		//echo json_encode($select_ajax);
		exit(json_encode($select_ajax));
	
	} else {
		
		$select = Catalog::getAuhtor(); 
	}
		
	return ['get_auhtor' => $select];
		
	}
}
