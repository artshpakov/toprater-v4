@toprater.service "State", [ "$location", "data", "Criterion", "Filter", ($location, data, Criterion, Filter) ->

  @criteria = []
  @filters  = []

  @items    = []
  callbacks = []

  callbacks.push =>
    @items = _.union @criteria, @filters
  callbacks.push =>
    url = "#{ data.state.locale }/#{ data.state.sphere }/objects"
    url = url + "/criteria/" + (criterion.name for criterion in @criteria).join(',') if @criteria.length
    url = url + "/filters/" + ("#{filter.name}/#{_.compact filter.value}" for filter in @filters).join('/') if @filters.length
    $location.url url

  triggerCallbacks = ->
    cb.call() for cb in callbacks


  @addCriterion = (criterion, options={}) ->
    @criteria.push criterion unless criterion in @criteria
    triggerCallbacks() unless options.silent

  @removeCriterion = (criterion, options={}) ->
    @criteria = _.without @criteria, criterion
    triggerCallbacks() unless options.silent

  @addFilter = (filter, options={}) ->
    @filters.push filter unless filter in @filters
    triggerCallbacks() unless options.silent


  @onChange = (callback) ->
    callbacks.push callback unless callback in callbacks

  @trigger = (event) ->
    triggerCallbacks() if event is 'change'


  _.each data.state.criteria, (name) =>
    @addCriterion Criterion.find(name), silent: true

  _.each data.state.filters, (value, name) =>
    @addFilter Filter.find(name).setValue(value), silent: true

  @

]
