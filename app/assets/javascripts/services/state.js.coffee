@toprater.service "State", [ "$location", "data", "Criterion", "Filter", ($location, data, Criterion, Filter) ->

  @criteria = []
  @filters  = []
  callbacks = []

  callbacks.push =>
    url = "#{ data.state.locale }/#{ data.state.sphere }/objects"
    url = url + "/criteria/" + (criterion.name for criterion in @criteria).join(',') if @criteria.length
    if @filters.length
      filtersStrings = _.compact _.map @filters, (filter) -> "#{ filter.name }/#{ filter.toParam() }" if filter.toParam()
      url = url + "/filters/" + filtersStrings.join('/') if filtersStrings.length
    $location.url url

  triggerCallbacks = ->
    cb.call() for cb in callbacks


  @addCriterion = (criterion, options={}) ->
    @criteria.push criterion unless criterion in @criteria
    triggerCallbacks() unless options.silent

  @removeCriterion = (criterion, options={}) ->
    @criteria = _(@criteria).without criterion
    triggerCallbacks() unless options.silent

  @addFilter = (filter, options={}) ->
    @filters.push filter unless filter.name in _.pluck(@filters, 'name')
    triggerCallbacks() unless options.silent

  @removeFilter = (filter, options={}) ->
    @filters = _(@filters).without filter
    triggerCallbacks() unless options.silent


  @toObject = ->
    params =
      criteria: _.pluck(@criteria, 'name')
      filters:  _.object(_.pluck(@filters, 'name'), _.pluck(@filters, 'value'))
    delete params.filters.catalog if params.filters.coordinates # which is ugly
    params


  @onChange = (callback) ->
    callbacks.push callback unless callback in callbacks

  @triggerChange = (event) ->
    triggerCallbacks()


  _.each data.state.criteria, (name) =>
    @addCriterion Criterion.find(name), silent: true

  _.each data.state.filters, (value, name) =>
    @addFilter Filter.find(name).setValue(value), silent: true

  @

]
