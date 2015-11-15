"use strict"

angular.module('storeApp').controller 'StoreReceiptsCtrl', [
  '$scope'
  'orderItems'
  ($scope, orderItems) ->
    vm = this
    vm.order_items = orderItems.order_items

    vm
]
