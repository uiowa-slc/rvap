<% if $Address %><p><strong>Mailing address: </strong>$Address</p><% end_if %>
<p>
	<strong>Service areas: </strong><% loop $Counties %><a href="$Link">$Title</a><%if not $Last %>, <% end_if %><% end_loop %><br />
	<% if $Email %><strong>Email address: </strong><a href="mailto:$Email">$Email</a><br /><% end_if %>
	<% if $LocalCrisisLine %><strong>Local crisis line: </strong>$LocalCrisisLine <br /><% end_if %>
	<% if $RegionalHotline %><strong>Regional crisis line: </strong>$RegionalHotline <br /><% end_if %>
	<% if $TwentyFourHourCrisisLine %><strong>24 hour crisis line: </strong>$TwentyFourHourCrisisLine <br /><% end_if %>
	<% if $SpanishLine %><strong>Spanish line: </strong>$SpanishLine <br /><% end_if %>
	<% if $Phone %><strong>Office phone number: </strong>$Phone<br /><% end_if %>
	<% if $Fax %><strong>Fax:</strong> $Fax<br /><% end_if %>
	<% if $OutreachOffices %><strong>Outreach offices: </strong>$OutreachOffices <br /><% end_if %>
	<% if $CrisisLines %><strong>Other crisis lines: </strong>$CrisisLines <br /><% end_if %>
	
	<% if $ServicesOffered %><strong>Services offered: </strong>$ServicesOffered <br /><% end_if %>
</p>
