"use strict"

angular.module('storeApp').controller 'OrdersCtrl', [
  '_'
  '$scope'
  '$state'
  '$log'
  '$modal'
  'textiles'
  'rollsFactory'
  'orders'
  (_, $scope, $state, $log, $modal, textiles, rollsFactory, orders) ->
    $scope.textiles = textiles.textiles
    $scope.statuses = orders.statuses
    $scope.orders = orders.orders
    $scope.order = orders.order
    $scope.roll = {}

    $scope.updateTotal = ->
      $scope.order.total = Math.round(_.reduce($scope.order.order_items, (memo, order_item)->
        memo + (order_item.amount_ordered ||= order_item.left) * (order_item.price_sold ||= 0.01)
      0) * 100) / 100

    $scope.addItem = ->
      modalInstance = $modal.open(
        templateUrl: 'views/textiles/_index.html'
        controller: 'TextilesCtrl'
        scope: $scope
        size: 'lg')
      modalInstance.result.finally ->
        $scope.updateTotal()

    $scope.addOrder = ->
      orders.add(order: $scope.order).then ->
        $state.go 'orders'

    $scope.resetForm = ->
      $state.reload()

    $scope.removeItem = ->
      $scope.order.order_items = _.reject($scope.order.order_items, (order_item) ->
        order_item.selected)
      $scope.updateTotal()
      $scope.checkDiscount()
      $scope.checkStatus()


    $scope.checkDiscount = ->
      $scope.order.discount = if ($scope.order.discount > $scope.order.total) then $scope.order.total else Math.round($scope.order.discount * 100) / 100

    $scope.checkStatus = ->
      $scope.order.status = switch
        when $scope.order.prepay >= $scope.order.total then $scope.statuses[2]
        when $scope.order.prepay > 0 then $scope.statuses[1]
        else $scope.statuses[0]

    $scope.selectRoll = (roll_id, price, name, left, suffix, code) ->
      if !_.some($scope.order.order_items, {roll_id: roll_id, price_sold: price})
        order_item = {roll_id: roll_id, price_sold: price, amount_ordered: 1, name: name, left: left, suffix: suffix, code: code, item_comment: ""}
        $scope.order.order_items.push order_item

]
