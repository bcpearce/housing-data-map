# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

new_map = () ->
  mapCanvas = document.getElementById('map-canvas');
  mapOptions =
    center: new google.maps.LatLng(40.783, -73.965)
    zoom: 10

  map = new google.maps.Map(mapCanvas, mapOptions);

$(document).ready(new_map)
