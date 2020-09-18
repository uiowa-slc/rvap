<?php

use SilverStripe\Control\Email\Email;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\HeaderField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataObject;
use SilverStripe\TagField\TagField;
use Symbiote\Addressable\Forms\RegexTextField;

class IsahResource extends DataObject {

	private static $db = array(
		'Title' => 'Varchar(155)',
		//'Address'         => 'HTMLText',
		'Phone' => 'Text',
		'Email' => 'Text',
		'Website' => 'Text',
		'Content' => 'HTMLText',
		'ServicesOffered' => 'HTMLText',
		'POBox' => 'Varchar(155)',
		'ConfidentialLocationCity' => 'Varchar(155)',
		'ConfidentialLocationState' => 'Varchar(155)',
		'FriendlyDirections' => 'HTMLText',

	);

	private static $has_one = array(
		'County' => 'County',
	);

	private static $singular_name = 'Resource';

	private static $many_many = array(
		'Categories' => 'IsahResourceCategory',
	);

	public function getCMSFields() {
		//$f = parent::getCMSFields();

		$f = new FieldList();
		$f->push(new TextField('Title', 'Title'));
		$catField = TagField::create('Categories', 'Categories (use the category "SA Center" to denote a center\'s location)', IsahResourceCategory::get(), $this->Categories())->setShouldLazyLoad(true);
		$f->push($catField);

		$f->push(new TextField(Email::class, 'Email Address'));
		$f->push(new TextField('Website', 'Website URL (please include the http:// or https://)'));

		$addrFields = $this->getAddressFields();
		foreach ($addrFields as $field) {
			$f->push($field);
		}
		$f->push(new TextField('Phone', 'Phone number'));
		//$f->push(new TextField('POBox', 'P.O. Box (if separate from address above)'));
		$f->push(new TextareaField('FriendlyDirections', 'Friendly directions'));

		$f->push(new HeaderField('ConfidentialLocation', 'Confidential Location'));
		$f->push(new TextField('ConfidentialLocationCity'));
		$f->push(new TextField('ConfidentialLocationState'));

		//$f->removeByName('Suburb');
		$f->renameField('Postcode', 'ZIP code');
		$f->renameField('Suburb', 'City');

		return $f;
	}

	private function getAddressFields($_params = array()) {
		$params = array_merge(
			array(
				'includeHeader' => true,
			),
			(array) $_params
		);

		$fields = array(
			TextField::create('Address', _t('Addressable.ADDRESS', 'Address')),
			TextField::create('Suburb', _t('Addressable.SUBURB', 'Suburb')),
		);

		if ($params['includeHeader']) {
			array_unshift(
				$fields,
				HeaderField::create('AddressHeader', _t('Addressable.ADDRESSHEADER', 'Address'))
			);
		}

		// Get state field
		$label = _t('Addressable.STATE', 'State');
		$allowedStates = $this->owner->getAllowedStates();
		if (count($allowedStates) >= 1) {
			// If allowed states are restricted, only allow those
			$fields[] = DropdownField::create('State', $label, $allowedStates);
		} elseif (!$allowedStates) {
			// If no allowed states defined, allow the user to type anything
			$fields[] = TextField::create('State', $label);
		}

		// Get postcode field
		$postcode = RegexTextField::create('Postcode', _t('Addressable.POSTCODE', 'Postcode'));
		$postcode->setRegex($this->getPostcodeRegex());
		$fields[] = $postcode;

		// Get country field
		$fields[] = DropdownField::create(
			'Country',
			_t('Addressable.COUNTRY', 'Country'),
			$this->owner->getAllowedCountries()
		);

		$this->owner->extend("updateAddressFields", $fields);

		return $fields;
	}

	/**
	 * @return string
	 */
	private function getPostcodeRegex() {
		// Get postcode regex from extending object. (ie. Page, DataObject)
		$regex = $this->owner->config()->postcode_regex;
		if ($regex) {
			return $regex;
		}

		// Get postcode  regex global. If there are no specific rules on a Page/DataObject
		// fallback to what is configured on this extension
		$regex = Config::inst()->get(__CLASS__, 'postcode_regex');
		if ($regex) {
			return $regex;
		}

		return '';
	}

}
