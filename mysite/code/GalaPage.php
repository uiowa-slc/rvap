<?php
//For some reason this page type is required due to a db thing. Not sure what's up but DO NOT DELETE this page type.
class GalaPage extends Page {

	private static $db = array(

	);

	public function getCMSFields() {
		$f = parent::getCMSFields();

		return $f;
	}

}
