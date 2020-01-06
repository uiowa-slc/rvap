<?php

use SilverStripe\ORM\DataObject;

class IsahResourceCategory extends DataObject {

	private static $db = array(
		'Title'      => 'Varchar(155)',
		'URLSegment' => 'Varchar(255)',
	);
	private static $extensions = array(
		'IsahProjectDirectoryURLSegmentExtension',
	);

	private static $singular_name     = 'ResourceCategory';
	private static $belongs_many_many = array(
		'Resources' => 'IsahResource',
	);

	private static $default_sort = 'Title ASC';

}
