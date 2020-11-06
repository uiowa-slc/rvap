$Header
<main class="main-content__container" id="main-content__container">

	<!-- Background Image Feature -->
	<% if $BackgroundImage %>
		<% include FeaturedImage %>
	<% end_if %>

	<nav aria-label="Breadcrumb" class="breadcrumb no-print">
		<div class="column row">

		</div>
	</nav>

<% if not $BackgroundImage %>
	<div class="column row">
		<div class="main-content__header">
            <ol class="breadcrumbs" itemscope="" itemtype="http://schema.org/BreadcrumbList">
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"><a itemprop="item" href="/"><span itemprop="name">Home</span></a><meta itemprop="position" content="1"></li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"><a itemprop="item" href="/directory"><span itemprop="name">Resource Directory</span></a><meta itemprop="position" content="1"></li>
                <li itemscope="" itemprop="itemListElement" itemtype="http://schema.org/ListItem"><span class="show-for-sr">Current: </span><span itemprop="name">$County.Title County</span><meta itemprop="position" content="2"></li>
            </ol>
			<h1>$County.Title County</h1>
		</div>
	</div>
<% end_if %>

$BeforeContent

<div class="row">

	<div class="main-content main-content--with-padding <% if $SiteConfig.ShowExitButton %>main-content--with-exit-button-padding<% end_if %> <% if $Children || $Menu(2) || $SidebarArea.Elements ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
		$BeforeContentConstrained
		<% if $MainImage %>
			<img class="main-content__main-img" src="$MainImage.ScaleMaxWidth(500).URL" alt="" role="presentation"/>
		<% end_if %>
		<div class="main-content__text">
			<% with $County %>
				<% if $Project %>
						<% with $Project %>
							<h3><a href="$Link">$Title</a></h3>
							<% include IsahProjectInfoCard %>
							<p><a href="$Link" class="btn btn-small btn-primary">More information</a> <% if $Website %><a href="$Website" class="button" target="_blank">Visit website &rarr;</a><% end_if %></p>
								<% if DVResource %>
									<h3>DV Resource:</h3>
									$DVResource
								<% end_if %>
								<% if ShelterResource %>
									<h3>Shelter Resource:</h3>
									$ShelterResource
								<% end_if %>
						<% end_with %>

						<% include NearbyProjectCenters %>
				<% end_if %>
				<% if $Categories %>
					<% loop $Categories %>
						<% include IsahCatCard %>
					<% end_loop %>
				<% end_if %>
			<% end_with %>
		<hr />
		<% include FeedbackLink %>
		<% include OtherDirectoryResources %>
		</div>
		$AfterContentConstrained
		$Form
		<% if $ShowChildPages %>
			<% include ChildPages %>
		<% end_if %>
	</div>
	<aside class="sidebar dp-sticky">
		<% include DirectorySideNav %>
		<% if $SideBarView %>
			$SideBarView
		<% end_if %>
		$Sidebar
	</aside>
</div>
$AfterContent

</main>
