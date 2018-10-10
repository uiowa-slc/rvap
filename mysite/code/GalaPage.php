<?php
class GalaPage extends Page {

	private static $db = array(
		
	);

	private static $has_one = array(
	);


	private static $many_many = array (
	);

    private static $many_many_extraFields=array(
      );

    private static $plural_name = "Pages";

	private static $defaults = array ();


	public function getCMSFields(){
		$f = parent::getCMSFields();
		
		return $f;
	}

	
}