@toprater.service "MapHelpers", ->

  bounds: (objects) ->
    lats = _.compact(object.coordinates?.latitude for object in objects)
    lngs = _.compact(object.coordinates?.longitude for object in objects)
    bounds =
      southwest:
        latitude: _.min(lats)
        longitude: _.min(lngs)
      northeast:
        latitude: _.max(lats)
        longitude: _.max(lngs)

  toFilter: (map) ->
    bounds = map.control.getGMap().getBounds()
    top    = bounds.getNorthEast().k
    right  = bounds.getNorthEast().D
    bottom = bounds.getSouthWest().k
    left   = bounds.getSouthWest().D
    {
      left_top:
        lat: top
        lng: left
      right_bottom:
        lat: bottom
        lng: right
    }
