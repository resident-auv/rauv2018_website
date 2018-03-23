---
title: "Details"
weight: 40  # weight sets the order in the menu at the top of the page
---

The Resident AUV Workshop will be held May 9-11 in [Maple Hall](http://uw.edu/maps/?mah) near the University of Washington Seattle campus.

<div id="map" style="height: 450px; width: 100%;"></div>

## Accommodataion

We have reserved space at group rates at the following hotels:

1. [Silver Cloud Inn](https://www.silvercloud.com/university/) (1.3 miles from the venue)
1. [Watertown Hotel](https://www.staypineapple.com/watertown-hotel-seattle-wa) (0.3 miles from venue)
1. [University Inn](https://www.staypineapple.com/university-inn-seattle-wa) (0.2 miles from the venue)

To secure a group rates, please mention  "Resident AUV - UW Oceanography" by __April 10th__.

Please contact us at [rauv@uw.edu](mailto:rauv@uw.edu) with questions.



<script>
  var map;
  function initMap() {
    // Third column is Google "Place ID".  Look up here:
    //  https://developers.google.com/places/place-id
    var locations = [
      ['Maple Hall', 'MH', "ChIJgdYywfMUkFQRFQYbApRgxRQ"],
      ['Silver Cloud Inn', '1', "ChIJdS0Vx4cUkFQRv-UDFEvfpKY"],
      ['Watertown Hotel', '2', "ChIJNXONXPQUkFQRMMReBgaPGUM"],
      ['University Inn', '3', "ChIJk91uaPQUkFQR65S3l9ByrBw"],
    ];

    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 47.6605, lng: -122.3082},
      zoom: 15
    });

    for (i = 0; i < locations.length; i++) {

      var request = {
        placeId: locations[i][2]
      };

      service = new google.maps.places.PlacesService(map);
      service.getDetails(request, callback.bind(null, locations[i]));

      function callback(location, place, status) {
        if (status == google.maps.places.PlacesServiceStatus.OK) {
          var infowindow = new google.maps.InfoWindow({
            content: location[0]
          });


          var icon = "spotlight-waypoint-a";

          if (location[1] == 'MH') {
            icon = "spotlight-waypoint-b";
          }

          var iconUrl = "https://mts.googleapis.com/vt/icon/name=icons/spotlight/"+icon+".png&text=" + location[1] + "&psize=16&color=ff333333&ax=44&ay=48&scale=1";

          var marker = new google.maps.Marker({
            position: place.geometry.location,
            map: map,
            icon: iconUrl
          });

          marker.addListener('click', function() {
            infowindow.open(map, marker);
          });
        }
      }


    }
  }
</script>

<script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArrTZ3wRkkSGmrF-zYqq6aWh06EFBvBO4&callback=initMap&libraries=places">
</script>
