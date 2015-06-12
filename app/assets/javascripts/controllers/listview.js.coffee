@toprater.controller "ListViewCtrl", [ "$scope", "$rootScope", "State", "Alternative", ($scope, $rootScope, State, Alternative) ->

  $scope.alternatives = []

  State.onChange ->
    criteria = _.pluck State.criteria, 'name'
    Alternative.rate({criteria}).then ->
      $scope.alternatives = Alternative.items
      $rootScope.$broadcast('update-alternatives')
  State.trigger 'change'

  $scope.hoverCard = (alternative) ->
  	console.log alternative

]
