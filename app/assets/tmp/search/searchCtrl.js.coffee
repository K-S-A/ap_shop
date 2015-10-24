angular.module('storeApp').controller 'SearchCtrl', [
  '$scope'
  '$state'
  'searchFactory'
  ($scope, $state, searchFactory) ->
    $scope.code = ""
    $scope.rolls = searchFactory.rolls

    $scope.searchRoll = (code) ->
      searchFactory.search(code)
      return

    $scope.resetForm = ->
      $state.reload()
      return

    return

]
