            <% with $County %>
                <% if $Categories %>
                    <% loop $Categories %>
                       <% if $FilteredResources %>

                                <h3>$Title</h4>

                                    <% loop $FilteredResources %>

                                        <h4>
                                            $Title
                                        </h4>
                                        <% if $FullAddressHTML %>$FullAddressHTML<% end_if %>
                                        <% if $FriendlyDirections %><strong>Note:</strong> $FriendlyDirections <br /><% end_if %>
                                        <% if $Phone %><p><strong>Phone:</strong> $Phone</p><% end_if %>
                                        <% if $Website %><p><a class="bttn bttn--caps bttn--primary" href="$Website" target="_blank" rel="noopener">Visit Website <span class="fa-arrow-right fas"></span></a></p><% end_if %>
                                        <% if $ConfidentialLocationCity || $ConfidentialLocationState %>
                                            <strong>Confidential Location:</strong> <% if $ConfidentialLocationCity %>$ConfidentialLocationCity<% end_if %><% if $ConfidentialLocationCity %>, $ConfidentialLocationState<% end_if %>
                                        <% end_if %>

                                    <% end_loop %>

                        <% end_if %>
                    <% end_loop %>
                    <hr class="element--spacer-thin" />
                <% end_if %>
            <% end_with %>
