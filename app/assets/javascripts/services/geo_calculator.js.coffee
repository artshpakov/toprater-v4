@toprater.service "GeoCalculator", ->

  getBounds: (objects) ->
    lats = _.compact(object.coordinates?.latitude for object in objects)
    lngs = _.compact(object.coordinates?.longitude for object in objects)
    bounds =
      southwest:
        latitude: _.min(lats)
        longitude: _.min(lngs)
      northeast:
        latitude: _.max(lats)
        longitude: _.max(lngs)
