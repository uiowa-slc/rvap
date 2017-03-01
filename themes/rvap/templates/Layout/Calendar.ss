<% include BackgroundImage %>
<div class="gradient">
	<div class="container clearfix">
		<div class="white-cover"></div>
	    <article class="main-content <% if $BackgroundImage %>margin-top<% end_if %>" role="main">
	    	$Breadcrumbs
	    	
	    	<h1>$Title</h1>
	    	$Content
	    	<h2>$DateHeader</h2>
			<% if $Events %>
				<div id="event-calendar-events">
				  <% include EventList %> 
				</div>
			<% else %>
			  <p><% _t('NOEVENTS','There are no events') %>.</p>
			<% end_if %>

	    	$Form
	    </article>
	    <section class="sec-content hide-print">
	    	<% include SideNav %>
	   		<div class="event-calendar-controls">
			  $CalendarWidget
			  $MonthJumper
			 
			</div>

	    	

	    	

	    </section>
	</div>
</div>
<% include TopicsAndNews %> 

