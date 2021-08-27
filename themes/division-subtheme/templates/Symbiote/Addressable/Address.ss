<address>
	<% if $Address %>$Address<br><% end_if %>
	<% if $Suburb || $State || $Postcode %>
	{$Suburb}, $State $Postcode<br>
	<% end_if %>
	$CountryName
</address>