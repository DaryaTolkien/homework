<?php

Class Model_Cabinet extends Model{
	
	function get_data(){
		
		 Session::init();
		 $test = Session::get('loggedIn');
           if($test == false) {
              Session::destroy();
              header('Location: /main');
              exit();
  }
		if(isset(($_GET['exit']))){
           Session::destroy();
           header('Location: /main');
           exit();
        }
    }
}
