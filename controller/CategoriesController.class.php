<?php

class CategoriesController extends Controller
{

    public $view = 'categories';

    public function index($data)
    {
        $categories = Category::getCategories();
        return ['subcategories' => $categories];
    }
}
?>