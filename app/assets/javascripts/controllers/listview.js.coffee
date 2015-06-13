@toprater.controller "ListViewCtrl", [ "$scope", "State", "Alternative", "GeoCalculator", ($scope, State, Alternative, GeoCalculator) ->

  $scope.alternatives = []

  State.onChange ->
    criteria = _.pluck State.criteria, 'name'
    Alternative.rate({criteria}).then ->
      $scope.alternatives = Alternative.items
      $scope.map.bounds = GeoCalculator.getBounds(Alternative.items)
      $scope.map.markers = Alternative.items
      _.each $scope.map.markers, (marker, index) ->
        marker.options =
          labelContent: index+1
          labelClass: 'map-label'

  State.trigger 'change'

  $scope.map =
    center:
      latitude: 0,
      longitude: 0
    zoom: 1
    options:
      scrollwheel: false

  $scope.hoverCard = (alternative, over=true) ->
    alternative.options.labelClass = if over then 'map-label-hovered' else 'map-label'

]
