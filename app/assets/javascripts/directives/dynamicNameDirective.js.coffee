"use strict"

angular.module('storeApp').directive "dynamicName", [
  '$compile'
  '$log'
  ($compile, $log) ->
    restrict: "A"
    terminal: true
    priority: 1000
    link: (scope, element, attrs) ->
      name = scope.$eval(attrs.dynamicName)
      if name
        element.attr "name", name
        element.removeAttr "dynamic-name"
        $compile(element) scope

]
