@toprater.controller "CompleterCtrl", ["$scope", "State", "Criterion", ($scope, State, Criterion) ->

  $scope.results = []
  $scope.State = State


  compare = (string, substring) ->
    string.toLowerCase().indexOf(substring.toLowerCase()) is 0

  State.onChange ->
    $scope.query = ""
    $scope.results = []


  $scope.$watch 'query', (query) ->
    if query
      $scope.results = _.filter Criterion.items, (item) -> compare item.label, query

  $scope.pickItem = (item) ->
    State.addCriterion item

  $scope.removeItem = (item) ->
    State.removeCriterion item
    
]
