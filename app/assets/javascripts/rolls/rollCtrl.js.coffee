angular.module('storeApp').controller 'RollCtrl', [
  '$scope'
  'getRoll'
  ($scope, getRoll) ->
    $scope.roll = getRoll
]
