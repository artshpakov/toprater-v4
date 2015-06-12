@toprater.factory "Criterion", [ "$resource", "data", ($resource, data) ->

  Criterion = $resource()

  Criterion.items = _.map data.criteria, (attrs) ->
    new Criterion attrs

  Criterion.find = (name) ->
    _.findWhere @items, {name}

  Criterion::toString = -> @label

  Criterion

]
