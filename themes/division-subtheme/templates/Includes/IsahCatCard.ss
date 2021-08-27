<% if $FilteredResources %>
<div class="row collapse">
	<div class="large-12 columns">
		<h4 class="resource__cat-name">$Title</h4>
		<div class="grid-x">
			<% loop $FilteredResources %>
				<div class="cell small-12 medium-6"><% include IsahResourceCard %></div>
			<% end_loop %>
		</div>
	</div>
</div>
<% end_if %>