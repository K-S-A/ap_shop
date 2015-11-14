"use strict"

angular.module('storeApp').controller 'TextilesCtrl', [
  '_'
  '$scope'
  '$state'
  'textiles'
  'rollsFactory'
  (_, $scope, $state, textiles, rollsFactory) ->
    vm = this
    vm.roll = textiles.roll
    vm.arrival = textiles.arrival
    vm.textiles = textiles.textiles
    vm.obj = textiles.obj
    vm.datePattern = rollsFactory.datePattern
    vm.order = $scope.$parent.order

    vm.resetForm = (textile) ->
      textiles.resetForm(textile)

    vm.searchTextile = ->
      textiles.searchTextile()

    vm.addRoll = (textile) ->
      rollsFactory.add(vm.roll).then (data) ->
        textiles.addRoll(textile, data)
        textiles.resetForm(textile)

    vm.deleteRoll = (id, textile) ->
      rollsFactory.delete(id).then (res) ->
        textiles.deleteRoll(id, textile)

    vm.repeatSearch = ($index) ->
      textiles.repeatSearch($index)
      textiles.searchTextile()

    vm.removeSearch = ($event, $index) ->
       $event.stopPropagation()
       textiles.removeSearch($index)

    vm
]
