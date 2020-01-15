<% if $County.Resources || $County.Project %>
	<% with $County %>
	<p><button class="button" id="new-search-btn">Start a new search</button></p>
	<h2>Showing results for <a href="$Link">$Title County</a>:</h2>

		<% if $Project %>
			<div class="project">
				<h3 class="project__cat-name">Sexual Assault Project for $Title County</h3>
				<% with $Project %>
					<h4><a href="$Link">$Title</a></h4>
					<% include IsahProjectInfoCard %>
					<p><a href="$Link" class="btn btn-small btn-primary">More information</a> <% if $Website %><a href="$Website" class="button" target="_blank">Visit website &rarr;</a><% end_if %></p>
						<% if DVResource %>
							<h5>DV Resource:</h5>
							$DVResource
						<% end_if %>
						<% if ShelterResource %>
							<h5>Shelter Resource:</h5>
							$ShelterResource
						<% end_if %>
				<% end_with %>
				<% include NearbyProjectCenters %>
			</div>
		<% end_if %>
		<% if $Categories %>
			<h3>More $Title County Resources:</h3>
			<% loop $Categories %>
				<% include IsahCatCard %>
			<% end_loop %>
		<% end_if %>
	<% end_with %>
<% else %>
<p><button class="button" id="new-search-btn">Start a new search</button></p>
<h2>No results found for $County.Title County</h2>
<p> If you feel you've received this message in error, please click the feedback link at the bottom of this page.</p>
<% end_if %>
