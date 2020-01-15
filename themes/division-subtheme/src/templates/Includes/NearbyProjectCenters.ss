<% if SaCenters %>
	<hr />
	<p><strong>Nearest location:</strong></p>
	<% loop SaCenters %>
		<% loop $FilteredResources %>
			<% include IsahResourceCard %>
		<% end_loop %>
	<% end_loop %>
<% end_if %>