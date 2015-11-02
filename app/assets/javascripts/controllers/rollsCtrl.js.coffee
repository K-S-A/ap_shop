"use strict"

angular.module('storeApp').controller 'RollsCtrl', [
  '$scope'
  'rollsFactory'
  ($scope, rollsFactory) ->
    $scope.rolls = rollsFactory.rolls
]
