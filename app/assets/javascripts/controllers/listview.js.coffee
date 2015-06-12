@toprater.controller "ListViewCtrl", [ "$scope", "State", "Alternative", ($scope, State, Alternative) ->

  $scope.alternatives = []

  State.onChange ->
    criteria = _.pluck State.criteria, 'name'
    Alternative.rate({criteria}).then ->
      $scope.alternatives = Alternative.items
  State.trigger 'change'

]
