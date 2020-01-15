<?php

class IsahDirectoryPage extends Page {

	private static $db = array(

	);
	private static $can_be_root = false;

	private static $defaults = array(
		'Content' => '',
	);

	private static $singular_name = 'Other Directory Resource';
	private static $icon_class = 'font-icon-p-document';
	public function getCMSFields() {
		$f = parent::getCMSFields();

		return $f;
	}


	

}
