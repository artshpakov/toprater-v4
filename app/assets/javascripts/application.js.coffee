#= require jquery
#= require jquery_ujs
#= require underscore
#= require angular
#= require angular-resource
#= require gmaps/google
#= require_self
#= require_tree .


@toprater = angular.module('toprater', ['ngResource']).config ["$locationProvider", ($locationProvider) ->
  $locationProvider.html5Mode true
]
@toprater.value 'data', window.topraterData
