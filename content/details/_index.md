---
title: "Details"
weight: 40  # weight sets the order in the menu at the top of the page
---

The Resident AUV Workshop will be held May 9-11 on the University of Washington Seattle campus.

__May 9-10__ will be in the Maple Hall Great Room (MH on map).  Doors open at 8AM.

__May 11__ will be in Henderson Hall (HH on map) Hardisty Conference Center. Use the east entrance and follow the signage or ask at the front desk.  Doors open at 8AM.

The reception on May 9 will be at 909 Boat Street (909 on map), a short walk from Maple Hall.

Workshop venues are a short walk from the University Inn and Watertown.


## Parking


[Paid parking](https://facilities.uw.edu/transportation/parking-daily-visitor) is available on campus (~4 blocks from workshop venues).  Please see a Campus Gatehouse for details.

<div id="map" style="height: 450px; width: 100%;"></div>



Please contact us at [rauv@uw.edu](mailto:rauv@uw.edu) with questions.



<script>
  var map;
  function initMap() {
    // Third column is Google "Place ID".  Look up here:
    //  https://developers.google.com/places/place-id
    var locations = [
      ['Maple Hall', 'MH', "ChIJgdYywfMUkFQRFQYbApRgxRQ", "http://uw.edu/maps/?mah"],
      ['Henderson Hall', 'HH', "ChIJWb7C2fMUkFQRsX0QJ2aFH94", "http://uw.edu/maps/?hnd"],
      ['909 Boat St.', '909', "ChIJE6f8C_EUkFQRcIXj55hfJOs", ""]
    ];

    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 47.655, lng: -122.315},
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

          var icon = "spotlight-waypoint-a";
          var address = place.address_components[0].long_name + " " + place.address_components[1].long_name;

          if (location[1] == 'MH') {
            icon = "spotlight-waypoint-b";
            var address = place.address_components[1].long_name + " " + place.address_components[2].long_name;
          }

          var infowindow = new google.maps.InfoWindow({
            // I realize this extraction of address is brittle...
            content: "<a href=" + location[3] + ">" + location[0] + "</a><br>" + address
          });






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
