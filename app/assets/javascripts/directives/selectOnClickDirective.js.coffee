"use strict"

angular.module('storeApp').directive "selectOnClick", ["$window", ($window) ->
  restrict: "A"
  link: (scope, element, attrs) ->
    element.on "click", ->
      @setSelectionRange 0, @value.length  unless $window.getSelection().toString()

]
