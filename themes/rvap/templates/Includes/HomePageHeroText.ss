	        <div class="hero-text">
	        	<% if $BackgroundFeature.Tagline %>
	        		<h2 class="blocktext">$BackgroundFeature.Tagline</h2>
	        	<% else %>
                	<h2 class="blocktext">$SiteConfig.Tagline</h2>
                <% end_if %>
                <% if $BackgroundFeature.Buttons %>
                	$BackgroundFeature.Buttons
  				<% end_if %>
                                <div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
            </div>