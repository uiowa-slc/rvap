
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
				<h1 class="page-title">
					<% if $ArchiveYear %>
						<%t Blog.Archive 'Archive' %>:
						<% if $ArchiveDay %>
							$ArchiveDate.Nice
						<% else_if $ArchiveMonth %>
							$ArchiveDate.format('F, Y')
						<% else %>
							$ArchiveDate.format('Y')
						<% end_if %>
					<% else_if $CurrentTag %>
						<%t Blog.Tag 'Tag' %>: $CurrentTag.Title
					<% else_if $CurrentCategory %>
						<%t Blog.Category 'Category' %>: $CurrentCategory.Title
					<% else %>
						$Title
					<% end_if %>
				</h1>
			</div>
		</div>
	<% end_if %>

	$BeforeContent

	<div class="row">
		<div role="main" class="main-content main-content--with-padding <% if $Children || $Menu(2) || $SidebarBlocks ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
			$BeforeContentConstrained
			<div class="main-content__text">
				<% if $PaginatedList.Exists %>
					<% loop $PaginatedList %>
						<article class="bloglistitem clearfix ">
							<% if $ThumbnailURL %>
								<a href="$Link" target="_blank"class="bloglistitem__img border-effect">
									<img class="dp-lazy" data-original="$ThumbnailURL" width="500" height="333" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" alt="$Title">
								</a>
							<% end_if %>
							<div class="bloglistitem__content<% if $FeaturedImage || $BackgroundImage || $YoutubeBackgroundEmbed %>--wimage<% end_if %>">
								<% if $Categories.exists %>
									<p class="bloglistitem__category">
									<% loop $Categories %>
										<span class="bloglistitem__category">Newsletter</span>
									<% end_loop %>
									</p>
								<% end_if %>

								<h3 class="bloglistitem__heading"><a href="$Link" target="_blank">$Title</a></h3>
								<p class="bloglistitem__desc">$Description.LimitCharacters(150)

								<div class="blogmeta__byline">
									<p><em class="byline__on">Posted on</em>
									<time datetime="$PublishDate.format(c)" itemprop="datePublished">$Date.format("F d, Y")</time></p>
								</div>

							</div>
						</article>
					<% end_loop %>
				<% end_if %>

				$AfterContentConstrained
				$Form
				$CommentsForm

				<% with $PaginatedList %>
					<% include Pagination %>
				<% end_with %>

			</div>
		</div>


		<aside class="sidebar dp-sticky">
			<% include SideNav %>
			<% if $SideBarView %>
				$SideBarView
			<% end_if %>
			$SidebarArea
		</aside>
	</div>

	$AfterContent

</main>
