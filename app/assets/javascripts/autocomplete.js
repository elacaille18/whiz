function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var options = {
     types: ['(cities)'],
     componentRestrictions: {country: "fr"}
     };

    var autocomplete = new google.maps.places.Autocomplete(element, options);

    if (id == 'trip_departure_city') {
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged1);
    } else if( id == 'trip_arrival_city') {
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged2);
    } else {
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    }



  }


}

function onPlaceChanged1() {
  var place = this.getPlace();

    document.getElementById('trip_departure_longitude').value = place.geometry.location.lat();
    document.getElementById('trip_departure_latitude').value = place.geometry.location.lng();
}

function onPlaceChanged2() {
  var place = this.getPlace();

    document.getElementById('trip_arrival_longitude').value = place.geometry.location.lat();
    document.getElementById('trip_arrival_latitude').value = place.geometry.location.lng();
}

function onPlaceChanged() {
  var place = this.getPlace();


}


// appelle sur le nom de l'id de la forme commenter car au debut on fait un matching de base

// google.maps.event.addDomListener(window, 'load', function() {
//   initializeAutocomplete('trip_departure_city');
//   initializeAutocomplete('trip_arrival_city');
//   initializeAutocomplete('mission_arrival_city');
//   initializeAutocomplete('mission_departure_city');
// });

