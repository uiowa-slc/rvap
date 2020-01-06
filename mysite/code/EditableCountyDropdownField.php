<?php

use SilverStripe\Forms\DropdownField;
use SilverStripe\UserForms\Model\EditableCustomRule;
use SilverStripe\UserForms\Model\EditableFormField;

/**
 * A dropdown field which allows the user to select a country
 *
 * @package userforms
 */
class EditableCountyDropdownField extends EditableFormField {

	private static $singular_name = 'Iowa County Dropdown';

	private static $plural_name = 'Iowa County Dropdowns';

	/**
	 * @return FieldList
	 */
	public function getCMSFields() {
		$fields = parent::getCMSFields();

		$fields->removeByName('Default');

		return $fields;
	}

	public function getFormField() {
		$field =  DropdownField::create($this->Name, $this->EscapedTitle, County::get()->map('Title'))
			->setEmptyString('(Select a county)')
			->setFieldHolderTemplate('UserFormsField_holder')
			->setTemplate('UserFormsDropdownField');

		$this->doUpdateFormField($field);

		return $field;
	}

	public function getValueFromData($data) {
		if(isset($data[$this->Name])) {
			$source = $this->getFormField()->getSource();
			return $source[$data[$this->Name]];
		}
	}

	public function getIcon() {
		return USERFORMS_DIR . '/images/editabledropdown.png';
	}

	public function getSelectorField(EditableCustomRule $rule, $forOnLoad = false) {
		return "$(\"select[name='{$this->Name}']\")";
	}
}