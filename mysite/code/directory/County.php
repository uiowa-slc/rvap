<?php

use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\DataObject;

class County extends DataObject {

	private static $db = array(
		'Title'      => 'Varchar(155)',
		'Region'     => 'Int',
		'URLSegment' => 'Text',
		'State'      => 'Text',
	);

	private static $extensions = array(
		'IsahProjectDirectoryURLSegmentExtension',
	);

	private static $has_one = array(
		'Project' => 'IsahProject',
	);

	private static $has_many = array(
		'Resources' => 'IsahResource',
	);

	private static $summary_fields = array(
		'Title', 'Region', 'URLSegment',
	);

	private static $defaults = array(
		'State' => 'IA',
	);

	private static $default_sort = "Title ASC";

	public function getCMSFields() {
		//$f = parent::getCMSFields();

		$f = new FieldList();
		$f->push(new TextField('Title', 'Title'));
		$f->push(new TextField('State', 'State'));
		$f->push(new TextField('Region', 'Region'));

		$resGridFieldConfig = GridFieldConfig_RecordEditor::create();
		$resGridField       = new GridField('Resources', 'Resources', $this->Resources(), $resGridFieldConfig);
		$f->push($resGridField);

		return $f;
	}

	public function Link() {
		return 'directory/county/show/'.$this->URLSegment.'/';
	}

	public function getCategories() {
		$resources  = $this->Resources();
		$categories = new ArrayList();

		$filteredCategories = new ArrayList();

		foreach ($resources as $resource) {
			$resourceCats = $resource->Categories();
			$categories->merge($resourceCats);
		}

		$categories->removeDuplicates();

		foreach ($categories as $category) {
			$filteredCategoryResults = $category->Resources()->filter(array('CountyID' => $this->ID));
			$filteredCategory        = new IsahResourceCategory();

			$filteredCategory->Title = $category->Title;
			//$filteredCategory->ID        = $category->ID;
			$filteredCategory->FilteredResources = new ArrayList($filteredCategoryResults->toArray());
			$filteredCategories->push($filteredCategory);

		}
		$filteredCategories->sort('Title ASC');

		return $filteredCategories;

	}

	public function getSaCenters() {
		$categories = $this->getCategories();
		$centerCat  = $categories->filter(array('Title' => 'SA Center'));

		return $centerCat;

	}
}