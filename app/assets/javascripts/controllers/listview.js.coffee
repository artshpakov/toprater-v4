@toprater.controller "ListViewCtrl", [ "$scope", "State", "Alternative", ($scope, State, Alternative) ->

  $scope.alternatives = []

  rate = (params) ->
    Alternative.rate(params).then ->
      $scope.alternatives = Alternative.items
      $scope.$broadcast 'alternatives:changed', Alternative.items

  State.onChange -> rate State.toObject()
  State.triggerChange()

  $scope.hoverCard = (alternative, over=true) ->
    alternative.markerOptions.labelClass = if over then 'map-label-hovered' else 'map-label'

]
