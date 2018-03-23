---
title: "Details"
weight: 40  # weight sets the order in the menu at the top of the page
---

The Resident AUV Workshop will be held May 9-11 in [Maple Hall](http://uw.edu/maps/?mah) near the University of Washington Seattle campus.

<div id="map" style="height: 450px; width: 100%;"></div>

## Accommodataion

We have reserved space at group rates at the following hotels:

1. __[Silver Cloud Inn](https://www.silvercloud.com/university/)__ (1.3 miles from the venue)<br>To secure the group rate at the Silver Cloud, use [this link](https://university.silvercloud.com/irmnet/(S(coilyhis0uvilawdxnlvj0bb))/res/resmain.aspx?g=RESIDENT&o=LABORATORY) or call the hotel directly at (206) 526-5200 or 1 (800) 205-6940 and ask for the "Resident-AUV" or "RESIDENT" group and the guest services agent will be able to assist with the reservation.    Must reserve by __April 10th__.

2. __[Watertown Hotel](https://www.staypineapple.com/watertown-hotel-seattle-wa)__ (0.3 miles from venue).
[Book online with code UWOCEANWT](https://gc.synxis.com/rez.aspx?shell=PineappleChain2&template=PineappleChain&Hotel=40206&Chain=17448&arrive=05/08/2018&depart=05/11/2018&adult=1&child=0&group=UWOCEANWT)  by __April 8th__.  The Watertown does not include breakfast.

3.  __[University Inn](https://www.staypineapple.com/university-inn-seattle-wa)__ (0.2 miles from the venue).  [Book online with the code UWOCEANUI](Link:https://gc.synxis.com/rez.aspx?shell=PineappleChain2&template=PineappleChain&Hotel=40207&Chain=17448&arrive=05/08/2018&depart=005/11/2018&adult=1&child=0&group=UWOCEANUI) by __April 8th__.  The University Inn _does_ include breakfast.



Please contact us at [rauv@uw.edu](mailto:rauv@uw.edu) with questions.



<script>
  var map;
  function initMap() {
    // Third column is Google "Place ID".  Look up here:
    //  https://developers.google.com/places/place-id
    var locations = [
      ['Maple Hall', 'MH', "ChIJgdYywfMUkFQRFQYbApRgxRQ", "http://uw.edu/maps/?mah"],
      ['Silver Cloud Inn', '1', "ChIJdS0Vx4cUkFQRv-UDFEvfpKY", "https://www.silvercloud.com/university/"],
      ['Watertown Hotel', '2', "ChIJNXONXPQUkFQRMMReBgaPGUM", "https://www.staypineapple.com/watertown-hotel-seattle-wa"],
      ['University Inn', '3', "ChIJk91uaPQUkFQR65S3l9ByrBw", "https://www.staypineapple.com/university-inn-seattle-wa"],
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
