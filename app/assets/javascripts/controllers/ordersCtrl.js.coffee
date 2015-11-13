"use strict"

angular.module('storeApp').controller 'OrdersCtrl', [
  '_'
  '$scope'
  '$state'
  '$modal'
  'orders'
  (_, $scope, $state, $modal, orders) ->
    vm = this
    vm.statuses = orders.statuses
    vm.orders = orders.orders
    vm.order = orders.order

    vm.addOrder = ->
      orders.add(order: vm.order).then ->
        $state.go 'orders'

    vm.addItem = ->
      modalInstance = $modal.open(
        templateUrl: 'views/textiles/_index.html'
        controller: 'TextilesCtrl as vm'
        scope: $scope
        size: 'lg')
      modalInstance.result.finally ->
        orders.updateTotal()

    vm.removeItem = (remove_all) ->
      orders.removeItem(remove_all)

    vm.resetForm = ->
      orders.resetOrder()
      $state.reload()

    vm.updateTotal = ->
      orders.updateTotal()

    vm.checkDiscount = ->
      orders.checkDiscount()

    vm.checkStatus = ->
      orders.checkStatus()

    $scope.selectRoll = (roll_id, price, name, left, suffix, code) ->
      orders.selectRoll(roll_id, price, name, left, suffix, code)

    vm
]
