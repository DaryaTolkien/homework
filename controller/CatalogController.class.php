<?php

class CatalogController extends Controller
{

    public $view = 'catalogs';

    public function index($data)
    {
        $catalog = Catalog::getCatalog();
        $goods = Good::getGoods($data['id']);
        return ['catalogs' => $catalog, 'goods' => $goods];
    }
	
	   
}
