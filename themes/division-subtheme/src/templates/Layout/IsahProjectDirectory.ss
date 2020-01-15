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
<% if FeedbackSuccess %>
          <p><strong>Thanks for submitting feedback to us, we've received your message.</strong></p>
        <% end_if %>
         <p class="geo-message" id="geo-message" style="display: none;"></p>
        <div id="directory-form">
        $Content
          <div class="row">
            <div class="large-3 columns">
              <p><button class="directory__button" id="get-location">Use my location</button></p>
            </div>
            <div class="large-1 columns">
              <p class="or-padding">Or</p>
            </div>
            <div class="large-8 columns">
                $CountyForm

            </div>
          </div>
            <p>If you're having trouble using the form above, <a href="directory/county/list">view a list of resources by county &rarr;</a></p>
          <!--<div id="mapholder"></div> -->


          <hr />
        </div>
          <div id="loading" style="display:none;">
            <h2>Loading results...</h2>
            <img src="{$ThemeDir}/dist/images/ajax-loader.gif" />
          </div>
        <div id="results" style="display:none;">

        </div>
        <% include OtherDirectoryResources %>
        <hr />
        <% include FeedbackLink %>
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

<%-- 41.663475,-91.5378082 --%>
<script src="//maps.google.com/maps/api/js?sensor=true&key=AIzaSyAjKPRvMS4fCJjRjdHh6nR4-ocJt_Y9kUg"></script>

