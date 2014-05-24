# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

equalHeight = (group) ->
  tallest = 0
  group.each ->
    thisHeight = $(this).height()
    tallest = thisHeight  if thisHeight > tallest
    return

  group.height tallest
  return

$(document).ready ->
  equalHeight $(".even-container")
  return

