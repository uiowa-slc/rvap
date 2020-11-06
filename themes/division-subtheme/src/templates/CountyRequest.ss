<% if $County.Resources || $County.Project %>
	<% with $County %>
	<p><button class="button hollow outline" id="new-search-btn">Start a new search</button></p>
	<h2>Showing results for {$Title} County:</h2>

		<% if $Project %>

            <div data-lat="$Lat" data-lng="$Lng">

            <h3>$Project.Title</h3>
            <% if $FullAddressHTML %>$FullAddressHTML<% end_if %>
            <% if $FriendlyDirections %><strong>Note:</strong> $FriendlyDirections <br /><% end_if %>
            <% if $Phone %><p><strong>Phone:</strong> $Phone </p><% end_if %>
            <% if $Website %><p><a href="$Website" class="button small" target="_blank">Visit Website &rarr;</a></p><% end_if %>
            <% if $ConfidentialLocationCity || $ConfidentialLocationState %>
                <strong>Confidential Location:</strong> <% if $ConfidentialLocationCity %>$ConfidentialLocationCity<% end_if %><% if $ConfidentialLocationCity %>, $ConfidentialLocationState<% end_if %>
            <% end_if %>
                <% with $Project %>
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

                <% if $Categories %>
                <h3>More $Title County Resources:</h3>
                <% loop $Categories %>
                    <% include IsahCatCard %>
                <% end_loop %>

                <% end_if %>
            </div>
		<% end_if %>
	<% end_with %>
<% else %>
    <p><button class="button" id="new-search-btn">Start a new search</button></p>
    <h2>No results found for $County.Title County</h2>
    <p> If you feel you've received this message in error, please click the feedback link at the bottom of this page.</p>
<% end_if %>
