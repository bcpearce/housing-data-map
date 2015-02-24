# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

origin = window.location.origin

newMap = () ->
  mapCanvas = document.getElementById('map-canvas');
  mapOptions =
    center: new google.maps.LatLng(40.783, -73.965)
    zoom: 11

  map = new google.maps.Map(mapCanvas, mapOptions);
  loadKmlLayer(map, gon.date)


loadKmlLayer = (map, date) ->
  if date == null
    if gon.zip_code_id
      kmlUrl = origin + Routes.zip_code_path(gon.zip_code_id, {format: 'kml'})
    if gon.is_index
      kmlUrl = origin + Routes.zip_codes_path({format:'kml'})
  else
    if gon.zip_code_id
      kmlUrl = origin + Routes.zip_code_path(gon.zip_code_id, {format: 'kml', date:date})
    if gon.is_index
      kmlUrl = origin + Routes.zip_codes_path({format:'kml', date:date})
  kmlOptions =
    singleInfoWindow: true
    preserveViewport: false
    map: map

  myParser = new geoXML3.parser(kmlOptions)
  myParser.parse(kmlUrl)

$(document).ready(newMap)

$(document).ready ->
  $('#date-picker').on 'change', ->
    date = $('#date-picker').val()
    window.location.replace(origin + Routes.zip_codes_path({date:date}))
