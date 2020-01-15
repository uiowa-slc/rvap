$Header
<main class="main-content__container" id="main-content__container">

	<!-- Background Image Feature -->
	<% if $BackgroundImage %>
		<% include FeaturedImage %>
	<% end_if %>

	<nav aria-label="Breadcrumb" class="breadcrumb no-print">
		<div class="column row">
			<ol class="clearfix breadcrumb__list" itemscope itemtype="http://schema.org/BreadcrumbList">
				<li class="breadcrumb__listitem" itemscope itemprop="itemListElement" itemtype="http://schema.org/ListItem">
					<a href="$BaseURL" class="breadcrumb__anchor" itemprop="item"><span class="breadcrumb__name" itemprop="name">Home</span></a><meta itemprop="position" content="1" />
				</li>
				
				
						<li class="breadcrumb__listitem" itemscope itemprop="itemListElement" itemtype="http://schema.org/ListItem"><a ></a>
							<a href="directory/" class="breadcrumb__anchor" aria-current="page" itemprop="item"><span itemprop="name">Directory</span></a><meta itemprop="position" content="2" />
						</li>
						<li class="breadcrumb__listitem" itemscope itemprop="itemListElement" itemtype="http://schema.org/ListItem"><a ></a>
							<a href="directory/county/list" class="breadcrumb__anchor" aria-current="page" itemprop="item"><span itemprop="name">Counties</span></a><meta itemprop="position" content="3" />
						</li>
						<li class="breadcrumb__listitem" itemscope itemprop="itemListElement" itemtype="http://schema.org/ListItem">
							<a href="$County.Link" class="breadcrumb__anchor" itemprop="item"><span itemprop="name">$County.Title</span></a><meta itemprop="position" content="3" />
						</li>

			</ol>
		</div>
	</nav>

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
			<% with $County %>
			<h2>$Title County Resources</h2>
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