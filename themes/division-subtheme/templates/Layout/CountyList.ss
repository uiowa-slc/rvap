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
                <li itemscope="" itemprop="itemListElement" itemtype="http://schema.org/ListItem"><span class="show-for-sr">Current: </span><span itemprop="name">By County</span><meta itemprop="position" content="2"></li>
            </ol>
			<h1>Resources By County</h1>
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

				<div class="row">
					<div class="medium-4 columns">
						<ul>
						<% loop $Counties.Limit(33,0) %>
							<li><a href="$Link">$Title</a></li>
						<% end_loop %>
						</ul>
					</div>
					<div class="medium-4 columns">
						<ul>
						<% loop $Counties.Limit(33,33) %>
							<li><a href="$Link">$Title</a></li>
						<% end_loop %>
						</ul>
					</div>
					<div class="medium-4 columns">
						<ul>
						<% loop $Counties.Limit(999,66) %>
							<li><a href="$Link">$Title</a></li>
						<% end_loop %>
						</ul>
					</div>
				</div>
			$Content
			$Form
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
