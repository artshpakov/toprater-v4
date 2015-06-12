#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->
  $('[role=criterion-root]').siblings('ul').hide()
  $('[role=criterion-root]').click ->
    $(@).siblings('ul').slideToggle(100)
