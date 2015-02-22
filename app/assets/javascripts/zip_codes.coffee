# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

newMap = () ->
  mapCanvas = document.getElementById('map-canvas');
  mapOptions =
    center: new google.maps.LatLng(40.783, -73.965)
    zoom: 10

  map = new google.maps.Map(mapCanvas, mapOptions);
  loadKmlLayer(map)


loadKmlLayer = (map) ->
  origin = window.location.origin
  kmlUrl = origin + Routes.zip_code_path(gon.zip_code_id, {format: 'kml'})
  kmlOptions =
    suppressInfoWindows: true
    preserveViewport: false
    map: map
  myParser = new geoXML3.parser({map:map})
  myParser.parse(kmlUrl)


$(document).ready(newMap)
