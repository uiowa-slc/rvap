<div class="card card__row <% if $Parent.Enclosed %>card--enclosed<% end_if %>" data-lat="$Lat" data-lng="$Lng">



    <div class="card__body">
        <h3 class="card__title">
            $Title
        </h3>
<% if $FullAddressHTML %>$FullAddressHTML<% end_if %>
<% if $FriendlyDirections %><strong>Note:</strong> $FriendlyDirections <br /><% end_if %>
<% if $Phone %><p><strong>Phone:</strong> $Phone </p><% end_if %>
<% if $Website %><p><a href="$Website" class="button small" target="_blank">Visit Website &rarr;</a></p><% end_if %>
<% if $ConfidentialLocationCity || $ConfidentialLocationState %>
    <strong>Confidential Location:</strong> <% if $ConfidentialLocationCity %>$ConfidentialLocationCity<% end_if %><% if $ConfidentialLocationCity %>, $ConfidentialLocationState<% end_if %>
<% end_if %>

    </div>
</div>
