

var geocoder;  // this object will handle the position<->address conversion
var x = $("#geo-message");
//var countyName;

function getLocation() {

  var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};
  console.log(options);
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(locationSuccess, showError, options); // , {maximumAge:60000, timeout:5000, enableHighAccuracy:true}
    } else {
        x.html("Geolocation is not supported by this browser.");
    }
}
function resetSearchForm(){

    x.hide();
    $('#results').hide();
    $('#directory-form').show();
    $("#Form_CountyForm_County").val("");
    if(history.pushState) {
        history.pushState(null, null, 'directory/');
    }
    else {
        window.location.hash = '';
    }
}
function loadFromHash(){
  x.hide();
  var countyHash = window.location.hash.substr(1);

  if(countyHash != ''){
    $('#loading').show();

    $('#Form_CountyForm_County').val(countyHash);
    $('#directory-form').hide();


    $('#results').load('directory/county/load/'+ countyHash, function(){
      $('#loading').hide();
      $('#results').show();
    });
    $('.open-feedback').magnificPopup({
      type: 'inline',
      preloader: false,
    });




  }else{
    resetSearchForm();
  }
}
function locationSuccess(position){
      x.hide();
      var lat = position.coords.latitude;
      var lon = position.coords.longitude;
      var accuracy = position.coords.accuracy;

      var latlon = new google.maps.LatLng(lat, lon);
      var geocoder = new google.maps.Geocoder();
      geocoder.geocode({'latLng': latlon}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {

          if(accuracy < 10000){
            $('#loading').show();
            var county = getCounty(results[0]);
           // document.getElementById('County').innerHTML = 'County: ' + county;

            var countyName = convertToSlug(county);
            countyName = countyName.replace("-county", "");
            //countyName =  convertToSlug(countyName);
            $('#directory-form').hide();
            //alert(countyName);


            $('#results').load('directory/county/load/'+ countyName, function(){
              $('#loading').hide();
              $('#results').show();
            });

                if(history.pushState) {
                    history.pushState(null, null, 'directory/#'+ countyName);
                }
                else {
                    window.location.hash = '#'+ countyName;
                }
            }else{
              x.show();
              x.html("We couldn't get an accurate location from your device. Some desktops require Wi-Fi to be enabled for the most accurate results. Please select a county from the dropdown or <a href='directory/county/list'>view a list of counties &rarr;</a>");
            }


        }
      });
  //showPosition(position);
}
function convertToSlug(Text)
{
    return Text
        .toLowerCase()
        .replace(/ /g,'-')
        .replace(/[^\w-]+/g,'')
        ;
}
function getGeocodedCountyNameFromPosition(position){

      var lat = position.coords.latitude;
      var lon = position.coords.longitude;
      var latlon = new google.maps.LatLng(lat, lon);

      var geocoder = new google.maps.Geocoder();
      geocoder.geocode({'latLng': latlon}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {

          var county = getCounty(results[0]);
         // document.getElementById('County').innerHTML = 'County: ' + county;

          countyName = county.replace("County", "");

        }
      });

}


function showPosition(position) {
    x.show();
    x.html("Location found.");
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    var latlon = new google.maps.LatLng(lat, lon);
    // okay, now we have the position (as a google maps latLng object),
    // now we send this position to geocoder
    // @see  https://developers.google.com/maps/documentation/javascript/geocoding


    var mapholder = document.getElementById('mapholder');
    mapholder.style.height = '250px';
    mapholder.style.width = '500px';

    var myOptions = {
      center:latlon,zoom:14,
      mapTypeId:google.maps.MapTypeId.ROADMAP,
      mapTypeControl:false,
      navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
    }
    var map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
    var marker = new google.maps.Marker({
      position:latlon,
      map:map,
      title:"You are here!"
    });
}

function showError(error) {
    x.show();
    switch(error.code) {
        case error.PERMISSION_DENIED:
            x.html("Location services on this device/browser are not allowed. Please check your device's settings.");
            break;
        case error.POSITION_UNAVAILABLE:

            x.html("We couldn't find your location because your device/browser may not have allowed us to.");
            break;
        case error.TIMEOUT:
            x.html("The request to get your location has timed out.");
            break;
        case error.UNKNOWN_ERROR:
            x.html("An unknown error occurred when trying to get your location information. Give us feedback by clicking the link at the bottom of the page.");
            break;
    }
}
// more info, see my post on http://stackoverflow.com/questions/27203977/google-api-address-components
function getCounty(geocodeResponse) {
  var type = "administrative_area_level_2";  //the function will look through the results and find a component with type = 'locatily'.  Then it returns that
  for(var i=0; i < geocodeResponse.address_components.length; i++) {
    for (var j=0; j < geocodeResponse.address_components[i].types.length; j++) {
      if (geocodeResponse.address_components[i].types[j] == type) {
        return geocodeResponse.address_components[i].long_name;
      }
    }
  }
  return '';
}

/* ========================================================================
 * DOM-based Routing
 * Based on http://goo.gl/EUTi53 by Paul Irish
 *
 * Only fires on body classes that match. If a body class contains a dash,
 * replace the dash with an underscore when adding it to the object below.
 *
 * .noConflict()
 * The routing is enclosed within an anonymous function so that you can
 * always reference jQuery with $, even when in .noConflict() mode.
 * ======================================================================== */

(function($) {

  // Use this variable to set up the common and page specific functions. If you
  // rename this variable, you will also need to rename the namespace below.
  var Sage = {
    // All pages
    'common': {
      init: function() {
     // Show/Hide the directory navigation on-click
      $('.open-feedback').magnificPopup({

        type: 'inline',
        preloader: false,

      });
      },
      finalize: function() {
        // JavaScript to be fired on all pages, after page specific JS is fired
      }
    },
    // Home page
    'home': {
      init: function() {
        // JavaScript to be fired on the home page
      },
      finalize: function() {
        // JavaScript to be fired on the home page, after the init JS
      }
    },
    // About us page, note the change from about-us to about_us.
    'IsahProjectDirectory': {
      init: function() {

        window.onpopstate = function (event) {
          loadFromHash();
        }
        if(window.location.hash) {
          loadFromHash();
        } else {
          // Fragment doesn't exist
        }

          //New search, reset everything.
          $("body").on('click', '#new-search-btn', function(e) {
              resetSearchForm();

          });
          //User selected something from the dropdown.
          $('#Form_CountyForm_County').on('change', function(e){
              x.hide();
              $('#loading').show();
              $('#directory-form').hide();
              $('#results').load('directory/county/load/'+ $('#Form_CountyForm_County').val(), function(){
                $('#loading').hide();
                $('#results').show();
              });
              $('.open-feedback').magnificPopup({
                  type: 'inline',
                  preloader: false,
             });

              if(history.pushState) {
                  history.pushState(null, null, 'directory/#'+$('#Form_CountyForm_County').val());
              }
              else {
                  window.location.hash = '#'+$('#Form_CountyForm_County').val();
              }

          });
          $('#get-location').on('click', function(e){
              //$('#results').innerHTML = 'Loading...';
              getLocation();
          });
      }
    }
  };

  // The routing fires all common scripts, followed by the page specific scripts.
  // Add additional events for more control over timing e.g. a finalize event
  var UTIL = {
    fire: function(func, funcname, args) {
      var fire;
      var namespace = Sage;
      funcname = (funcname === undefined) ? 'init' : funcname;
      fire = func !== '';
      fire = fire && namespace[func];
      fire = fire && typeof namespace[func][funcname] === 'function';

      if (fire) {
        namespace[func][funcname](args);
      }
    },
    loadEvents: function() {
      // Fire common init JS
      UTIL.fire('common');

      // Fire page-specific init JS, and then finalize JS
      $.each(document.body.className.replace(/-/g, '_').split(/\s+/), function(i, classnm) {
        UTIL.fire(classnm);
        UTIL.fire(classnm, 'finalize');
      });

      // Fire common finalize JS
      UTIL.fire('common', 'finalize');



    }
  };

  // Load Events
  $(document).ready(UTIL.loadEvents);

})(jQuery); // Fully reference jQuery after this point.

