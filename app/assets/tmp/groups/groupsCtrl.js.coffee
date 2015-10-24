angular.module('storeApp').controller 'GroupsCtrl', [
  '$scope'
  '$state'
  '_'
  'groupsFactory'
  ($scope, $state, _, groupsFactory) ->
    $scope.groups = groupsFactory.groups
    $scope.group = {}
    $scope.name = ""

    $scope.searchGroup = (name) ->
      groupsFactory.search(name)
      return

    $scope.resetForm = ->
      $state.reload()
      return

    $scope.addGroup = ->
      groupsFactory.create $scope.group
      $scope.message = "Group succesfully created!"
      _.delay (->
        $scope.resetForm()
        return
      ), 3000
      return


]
