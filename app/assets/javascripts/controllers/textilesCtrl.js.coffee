"use strict"

angular.module('storeApp').controller 'TextilesCtrl', [
  '_'
  '$scope'
  '$state'
  'textiles'
  'rollsFactory'
  (_, $scope, $state, textiles, rollsFactory) ->
    $scope.roll = {}
    $scope.textiles = textiles.textiles
    $scope.obj =
      code: null
      suffix: "*"
      name: null
      searches: textiles.searches
    $scope.datePattern = new RegExp("^([1-9]|0[1-9]|[1-2]\\d|3[0-1])\\W([1-9]|0[1-9]|1[1-2])\\W(19|" + new Date().getFullYear().toString().slice(0,2) + ")\\d{2}$")

    $scope.resetForm = (textile) ->
      textile.new = if textile.new then null else textile.id
      sfx = if textile.rolls.length is 0
        ""
      else
        suffixes = _.map(textile.rolls, (roll) ->
          roll.suffix)
        _.difference("abcdefghijklmnopqrstuvwxyz".split(''), suffixes)[0]
      $scope.roll =
        suffix: sfx
        textile_id: textile.new
      $scope.arrival = {}

    $scope.searchTextile = ->
      textiles.getAll($scope.obj.code, $scope.obj.name)
      $scope.roll.textile_id = false

    $scope.repeatSearch = (search) ->
      $scope.obj.code = search.code
      $scope.obj.name = search.name
      $scope.searchTextile()

    $scope.addRoll = (textile) ->
      rollsFactory.add($scope.roll).then (data) ->
        textile.rolls.push data
        $scope.resetForm(textile)

    $scope.deleteRoll = (id, textile) ->
      rollsFactory.delete(id).then (res) ->
        textile.rolls = _.reject(textile.rolls, (roll) ->
          roll.id is id)

]
