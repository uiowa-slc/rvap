<?php

use SilverStripe\Admin\ModelAdmin;

class CountyAdmin extends ModelAdmin {
	private static $menu_title = 'Counties';

	private static $url_segment = 'counties';

	private static $managed_models = array(
		'County',
	);

	private static $menu_icon = 'mysite/images/county-icon.png';
}