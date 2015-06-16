@toprater.factory "Filter", [ "$resource", "data", ($resource, data) ->

  Filter = $resource()

  Filter.find = (name) ->
    new Filter name: name, label: name

  Filter::setValue = (@value) -> @

  Filter::toString = ->
    switch @name
      when 'catalog' then "#{ @label }: #{ _.compact @value }"

  Filter::toParam = ->
    switch @name
      when 'catalog' then _.compact(@value).join(',')

  Filter

]
