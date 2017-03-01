<div class="gradient">
	<div class="container clearfix">
		<div class="white-cover"></div>
	    <article class="main-content <% if $BackgroundImage %>margin-top<% end_if %>" role="main">
	    	
			<p><a href="$Parent.Link">&laquo; Back to $Parent.Title</a></p>
			<div class="vevent">
			  <% if $Image %>
			    
			      <img src="$Image.ScaleWidth(800).URL" id="event-photo">
			   
			  <% end_if %> 
			  <h2 class="summary">$Title</h2>
			  <% with CurrentDate %>
			  <p class="dates">$DateRange<% if StartTime %> $TimeRange<% end_if %></p>
			  <p><a class="btn btn-small" href="$ICSLink" title="<% _t('CalendarEvent.ADD','Add to Calendar') %>">Add to Calendar</a><% if $Top.FacebookEventLink %>&nbsp;<a href="$Top.FacebookEventLink" class="btn btn-small">View Facebook Event</a><% end_if %></p>
			  <% end_with %>
			  			  <% if $Location %>
			  	<p><strong>Location:</strong>
			  		<% if $LocationLink %>
			  			<a href="$LocationLink" target="_blank">$Location</a>
			  		<% else %>
			  			$Location
			  		<% end_if %>
			  	</p>
			  <% end_if %>
			  $Content
			  
			  <% if OtherDates %>
			  <div class="event-calendar-other-dates">
			    <h4><% _t('CalendarEvent.ADDITIONALDATES','Additional Dates for this Event') %></h4>
			    <ul>
			      <% loop OtherDates %>
			      <li><a href="$Link" title="$Event.Title">$DateRange<% if StartTime %> $TimeRange<% end_if %></a></li>
			      <% end_loop %> 
			    </ul>
			  </div>
			  <% end_if %>
			</div>
			

	    </article>
	    <section class="sec-content hide-print">

	    	<div class="event-calendar-controls">
			  $CalendarWidget
			  
			</div>
	    	<% include SideNav %>

	    	

	    </section>
	</div>
</div>
<% include TopicsAndNews %> 


