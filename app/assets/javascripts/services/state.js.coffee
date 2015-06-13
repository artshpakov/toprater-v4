@toprater.service "State", [ "$location", "data", "Criterion", ($location, data, Criterion) ->

  @criteria = []
  callbacks = []
  # callbacks.push =>
  #   url = "#{ data.state.locale }/#{ data.state.sphere }/objects"
  #   url = url + "/criteria/" + (criterion.name for criterion in @criteria).join(',') if @criteria.length
  #   url = url + "/filters/" + ("#{name}/#{value}" for name, value of @filters).join(',') unless _.isEmpty(@filters)
  #   $location.url url

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

  @trigger = (event) ->
    triggerCallbacks() if event is 'change'

  _.each data.state.criteria, (name) =>
    @addCriterion Criterion.find(name), silent: true

  @

]
