@toprater.controller "MapCtrl", ["$scope", "State", "Alternative", "Filter", "MapHelpers", ($scope, State, Alternative, Filter, MapHelpers) ->

  listenToMapEvents = false # to prevent early triggering

  $scope.$on 'alternatives:changed', (event, alternatives) ->
    $scope.map.bounds = MapHelpers.bounds(Alternative.items) unless listenToMapEvents
    $scope.map.markers = Alternative.items
    _.each $scope.map.markers, (marker, index) ->
      marker.markerOptions =
        labelContent: index+1
        labelClass: 'map-label'
    setTimeout (-> listenToMapEvents=true), 1000

  reloadMap = ->
    if listenToMapEvents
      coordinates = MapHelpers.toFilter($scope.map)
      State.addFilter Filter.find('coordinates').setValue coordinates

  $scope.map =
    center:
      latitude: 0,
      longitude: 0
    zoom: 1
    events:
      dragend: reloadMap
      zoom_changed: reloadMap
    control: {}

]
