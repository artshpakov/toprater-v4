@toprater.service "State", [ "$location", "data", "Criterion", ($location, data, Criterion) ->

  @criteria = []
  callbacks = []
  callbacks.push =>
    url = if @criteria.length
      criteriaString = (criterion.name for criterion in @criteria).join(',')
      "#{ data.state.locale }/#{ data.state.sphere }/objects/criteria/#{ criteriaString }"
    else
      "#{ data.state.locale }/#{ data.state.sphere }/objects"
    $location.url url


  triggerCallbacks = ->
    cb.call() for cb in callbacks

  @addCriterion = (criterion, options={}) ->
    @criteria.push criterion unless criterion in @criteria
    triggerCallbacks() unless options.silent

  @removeCriterion = (criterion, options={}) ->
    @criteria = _.without @criteria, criterion
    triggerCallbacks() unless options.silent

  @onChange = (callback) ->
    callbacks.push callback unless callback in callbacks


  _.each data.state.criteria, (name) =>
    @addCriterion Criterion.find(name), silent: true

  @

]
