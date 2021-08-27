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

$BeforeContent

<div class="row">

	<article class="main-content main-content--with-padding <% if $SiteConfig.ShowExitButton %>main-content--with-exit-button-padding<% end_if %> <% if $Children || $Menu(2) || $SidebarArea.Elements ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
		$BeforeContentConstrained
		<% if $MainImage %>
			<img class="main-content__main-img" src="$MainImage.ScaleMaxWidth(500).URL" alt="" role="presentation"/>
		<% end_if %>
		<div class="main-content__text">
			$Content
			<hr />
			<% include FeedbackLink %>
		</div>
		$AfterContentConstrained
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
		$Sidebar
	</aside>
</div>
$AfterContent

</main>
