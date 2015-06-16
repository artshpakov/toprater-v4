@toprater.controller "ListViewCtrl", [ "$scope", "State", "Alternative", ($scope, State, Alternative) ->

  $scope.alternatives = []

  State.onChange ->
    criteria = _.pluck State.criteria, 'name'
    filters  = _.object _.pluck(State.filters, 'name'), _.pluck(State.filters, 'value')
    Alternative.rate({criteria, filters}).then ->
      $scope.alternatives = Alternative.items
  State.trigger 'change'

]
