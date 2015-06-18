@toprater.controller "CompleterCtrl", ["$scope", "State", "Criterion", ($scope, State, Criterion) ->

  $scope.results = []
  $scope.State = State


  compare = (string, substring) ->
    string.toLowerCase().indexOf(substring.toLowerCase()) is 0

  State.onChange ->
    $scope.query = ""
    $scope.results = []

  $scope.$watch 'query', (query) ->
    $scope.results = if query
      _.filter Criterion.items, (item) -> compare item.label, query
    else []

]
