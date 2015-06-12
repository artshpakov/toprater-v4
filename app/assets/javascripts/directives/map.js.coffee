@toprater.directive "trMap", (Alternative) ->

  (scope, elem, attrs) ->
    handler = Gmaps.build('Google')
    scope.$on 'update-alternatives', (event, args) ->
      handler.buildMap({ provider: {}, internal: {id: attrs.id}}, () ->

        markers = _.map Alternative.items, (alternative, index) ->
          if alternative.coordinates?
            lat: alternative.coordinates.lat
            lng: alternative.coordinates.lng
            infowindow: "#{ index+1 }. #{ alternative.name }"

        handler.bounds.extendWith handler.addMarkers(_.compact markers)
        handler.fitMapToBounds()
      )
