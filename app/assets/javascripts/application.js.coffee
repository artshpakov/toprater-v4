#= require jquery
#= require jquery_ujs
#= require underscore
#= require angular
#= require angular-resource
#= require angular-google-maps
#= require_self
#= require_tree .


@toprater = angular.module('toprater', ['ngResource', 'uiGmapgoogle-maps']).config ["$locationProvider", ($locationProvider) ->
  $locationProvider.html5Mode true
]
@toprater.value 'data', window.topraterData
