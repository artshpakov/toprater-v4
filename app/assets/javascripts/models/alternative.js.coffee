@toprater.factory 'Alternative', ["$resource", "data", ($resource, data) ->

  Alternative = $resource "/#{ data.state.locale }/#{ data.state.sphere }/objects/:id.json", { id: '@id' }, update: { method: 'PUT' }


  Alternative.items = []

  Alternative.rate = (params) ->
    Alternative.items = []

    fetching = @query(p: params).$promise
    fetching.then (response) =>
      @items = (new Alternative(attrs) for attrs in response)
    fetching

  Alternative

]
