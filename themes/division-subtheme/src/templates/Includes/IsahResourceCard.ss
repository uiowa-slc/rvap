<div class="county-resource" data-lat="$Lat" data-lng="$Lng">
<h5>$Title</h5>
<% if $FullAddressHTML %>$FullAddressHTML<% end_if %>
<% if $FriendlyDirections %><strong>Note:</strong> $FriendlyDirections <br /><% end_if %>
<% if $Phone %><p><strong>Phone:</strong> $Phone </p><% end_if %>
<% if $Website %><p><a href="$Website" class="button small" target="_blank">Visit Website &rarr;</a></p><% end_if %>
<% if $ConfidentialLocationCity || $ConfidentialLocationState %>
	<strong>Confidential Location:</strong> <% if $ConfidentialLocationCity %>$ConfidentialLocationCity<% end_if %><% if $ConfidentialLocationCity %>, $ConfidentialLocationState<% end_if %>
<% end_if %>
</div>