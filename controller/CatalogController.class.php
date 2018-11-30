<?php

class CatalogController extends Controller
{
		function __construct()
    {
        parent::__construct();
        $this->title .= ' | Каталог';
    }

    public $view = 'catalogs';

    public function index($data)
    {
        $catalog = Catalog::getCatalog();
        $goods = Good::getGoods($data['id']);
        return ['catalogs' => $catalog, 'goods' => $goods];
    }
	
	   
}
