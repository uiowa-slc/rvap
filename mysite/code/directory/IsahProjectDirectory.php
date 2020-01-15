<?php

use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use SilverStripe\Forms\GridField\GridFieldPaginator;
use SilverStripe\Forms\GridField\GridField;

class IsahProjectDirectory extends Page {

	private static $db = array(

	);
	private static $allowed_children = array(
		'IsahProject',
		'IsahDirectoryPage'
	);
	private static $defaults = array(
		'Content' => '',
	);
	private static $singular_name = 'Resource Directory';
	private static $icon_class = 'font-icon-book'; 

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeByName('Content');
		$fields->addFieldToTab("Root.Main", HTMLEditorField::create('Content', 'Content')->setRows(3));
		//$fields->removeByName('BackgroundImage');
		$fields->removeByName('Metadata');

		$countyGridFieldConfig = GridFieldConfig_RecordEditor::create();
		$countyGridFieldConfig->getComponentByType(GridFieldPaginator::class)->setItemsPerPage(100);

		$countyGridField = new GridField('Counties', 'Counties', County::get(), $countyGridFieldConfig);
		$fields->addFieldToTab("Root.Main", $countyGridField);

		return $fields;
	}



}
