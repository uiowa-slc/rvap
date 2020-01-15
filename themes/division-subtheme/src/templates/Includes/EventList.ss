<ul>
<% loop Events %>
<li class="vevent clearfix">
  <% if $Event.Image %>
    <a class="url" href="$Link">
      <img src="$Event.Image.ScaleWidth(800).URL" id="event-photo">
    </a>
  <% end_if %> 
  <h3 class="summary"><% if Announcement %>$Title<% else %><a class="url" href="$Link">$Event.Title</a><% end_if %></h3>
        <p class="dates">$DateRange<% if StartTime %> $TimeRange<% end_if %></p>
        <p><a class="button" href="$ICSLink" title="<% _t('CalendarEvent.ADD','Add to Calendar') %>">Add to Calendar</a><% if $Event.FacebookEventLink %>&nbsp;<a href="$Event.FacebookEventLink" class="button">View Facebook Event</a><% end_if %></p>

    <% if $Event.Location %>
        <p><strong>Location:</strong>
          <% if $Event.LocationLink %>
            <a href="$Event.LocationLink" target="_blank">$Event.Location</a>
          <% else %>
            $Event.Location
          <% end_if %>
        </p>
    <% end_if %>
  <% if Announcement %>
  $Content
  <% else %>
  <% with Event %>$Content.LimitWordCount(60)<% end_with %> <a href="$Link"><% _t('MORE','Read more&hellip;') %></a>
  <% end_if %>
  <% if OtherDates %>
  <div class="event-calendar-other-dates">
    <h5><% _t('Calendar.ADDITIONALDATES','Additional Dates for this Event') %>:</h5>
    <ul>
      <% loop OtherDates %>
      <li><a href="$Link" title="$Event.Title">$DateRange <% if StartTime %> $TimeRange<% end_if %></a></li>
      <% end_loop %>
    </ul>
  </div>
  <% end_if %>
</li>
<% end_loop %>
</ul>
<% if MoreEvents %>
<a href="$MoreLink" class="calendar-view-more"><% _t('Calendar.VIEWMOREEVENTS','View more events...') %></a>
<% end_if %>


