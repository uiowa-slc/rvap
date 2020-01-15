$Header
<main class="main-content__container" id="main-content__container">

	<!-- Background Image Feature -->
	<% if $BackgroundImage %>
		<% include FeaturedImage %>
	<% end_if %>
	$Breadcrumbs
<% if not $BackgroundImage %>
	<div class="column row">
		<div class="main-content__header">
			<h1>$Title</h1>
		</div>
	</div>
<% end_if %>

$BlockArea(BeforeContent)

<div class="row">

	<article role="main" class="main-content main-content--with-padding <% if $SiteConfig.ShowExitButton %>main-content--with-exit-button-padding<% end_if %> <% if $Children || $Menu(2) || $SidebarBlocks ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
		$BlockArea(BeforeContentConstrained)
		<% if $MainImage %>
			<img class="main-content__main-img" src="$MainImage.ScaleMaxWidth(500).URL" alt="" role="presentation"/>
		<% end_if %>
		<div class="main-content__text">
			<div class="row column">
				<div class="large-7 columns">
					<% include IsahProjectInfoCard %>
						<% if $Website %><p><a href="$Website" class="button" target="_blank">Visit website &rarr;</a></p><% end_if %>
						<% if DVResource %>
							<h2>DV Resource:</h2>
							$DVResource
						<% end_if %>
						<% if ShelterResource %>
							<h2>Shelter Resource:</h2>
							$ShelterResource
						<% end_if %>
				</div>

				<div class="large-3 large-offset-2 columns">
					<p>Jump to county:</p>
					<ul>
						<% loop $Counties %>
							<li><a href="{$Top.Link}#{$URLSegment}">$Title</a></li>
						<% end_loop %>
					</ul>					
				</div>
			</div>
			
			<% loop $Counties %>
				<h2 id="$URLSegment">$Title County Resources</h2>
				<% if $Resources %>
					<% loop $Categories %>
						<% include IsahCatCard %>
					<% end_loop %>
				<% end_if %>
			<hr />
			<% end_loop %>
			$Content
			$Form
			<% include FeedbackLink %>

			<% include OtherDirectoryResources %>
		</div>
		$BlockArea(AfterContentConstrained)
		$Form
		<% if $ShowChildPages %>
			<% include ChildPages %>
		<% end_if %>
	</article>
	<aside class="sidebar dp-sticky">
		<% include DirectorySideNav %>
		<% if $SideBarView %>
			$SideBarView
		<% end_if %>
		$BlockArea(Sidebar)
	</aside>
</div>
$BlockArea(AfterContent)

</main>
