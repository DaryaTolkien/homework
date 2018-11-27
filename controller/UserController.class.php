<?php

class UserController extends Controller{
	
    public $view = 'user';
    public $title;

    function __construct()
    {
        parent::__construct();
        $this->title .= ' | Личный кабинет';
    }
	
	
	public function index($data) {
		
    if(isset($_POST['my_file_upload'])){  
		
      //if(isset($_FILES['imgfile']) && !empty($_FILES['imgfile']['name'])){
		$files = $_FILES; // полученные файлы
		$id = $_POST['idfile'];
	  exit(json_encode($files));
		foreach( $files as $file ){
		 $file_name = $file['name'];
         $result = User::upload_file($file_name);
		}
         if(isset($result['error'])){
             $error = $result['error'];
         }else{
			  $img = $result['filename'];
          }
         
		
     if(!isset($error)){
            $update_img = User::UpdateImg($img, $id);
		    exit(json_encode($update_img));
     }else{
		 exit(json_encode($error));
     }
		
	}
		
		
	return ['photo_user' => $image_user];
		
	}
}