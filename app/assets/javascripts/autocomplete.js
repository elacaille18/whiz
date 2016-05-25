function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var options = {
     types: ['(cities)'],
     componentRestrictions: {country: "fr"}
     };

    var autocomplete = new google.maps.places.Autocomplete(element, options);
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

function onPlaceChanged() {
  var place = this.getPlace();

  // console.log(place);  // Uncomment this line to view the full object returned by Google API.

  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {  // Some types are ["country", "political"]
      var type_element = document.getElementById(component.types[j]);
      if (type_element) {
        type_element.value = component.long_name;
      }
    }
  }
}


// appelle sur le nom de l'id de la forme

google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('trip_departure_city');
  initializeAutocomplete('trip_arrival_city');
});
