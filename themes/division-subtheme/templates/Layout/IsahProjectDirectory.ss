$Header
<main class="main-content__container" id="main-content__container">

  <!-- Background Image Feature -->
  <% if $BackgroundImage %>
    <% include FeaturedImage %>
  <% end_if %>

<% if not $BackgroundImage %>
  <div class="column row">
    <div class="main-content__header">
        $Breadcrumbs
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
<% if FeedbackSuccess %>
          <p><strong>Thanks for submitting feedback to us, we've received your message.</strong></p>
        <% end_if %>
         <p class="geo-message" id="geo-message" style="display: none;"></p>
        <div id="directory-form">
        $Content
          <div class="row">
            <div class="large-4 columns">
              <p><button class="button" id="get-location">Use my location <i class="fas fa-map-marker-alt"></i></button></p>
            </div>
            <div class="large-1 columns">
              <p class="or-padding">Or</p>
            </div>
            <div class="large-7 columns">
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

<%-- 41.663475,-91.5378082 --%>
<script src="//maps.google.com/maps/api/js?sensor=true&key=AIzaSyAjKPRvMS4fCJjRjdHh6nR4-ocJt_Y9kUg"></script>

