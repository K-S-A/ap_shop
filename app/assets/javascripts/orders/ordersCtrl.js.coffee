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
    $scope.orders = orders.orders
    $scope.textiles = textiles.textiles
    $scope.roll = {}
    $scope.statuses = [
      'unconfirmed'
      'prepaid'
      'full payment'
      'processed'
      'ready'
      'delivered'
      'canceled']
    $scope.textiles = textiles.textiles
    $scope.order =
      number: null
      order_date: new Date().toISOString().split('T')[0]
      customer: ""
      order_comment: ""
      customer_phone: ""
      status: 'unconfirmed'
      prepay: 0
      discount: 0
      total: 0
      order_items: [
        {"roll_id":5,"price_sold":99.9,"name":"Textile3","left":1.0,"suffix":"a","code":"150577","item_comment":"", "amount_ordered": 1}
        {"roll_id":3,"price_sold":999.99,"name":"Textile1","left":22.4,"suffix":"b","code":"150579","item_comment":"", "amount_ordered": 1}]
    $scope.total = 0

    $scope.updateTotal = ->
      $scope.order.total = Math.round(_.reduce($scope.order.order_items, (memo, order_item)->
        order_item.amount_ordered = order_item.left unless order_item.amount_ordered
        order_item.price_sold = 0.01 unless order_item.price_sold
        memo + order_item.amount_ordered * order_item.price_sold
      0) * 100) / 100
      $scope.total = $scope.order.total - $scope.order.discount

    $scope.addItem = ->
      modalInstance = $modal.open(
        templateUrl: 'textiles/_index.html'
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

    $scope.clearItems =->
      $scope.order.order_items = []

    $scope.removeItem = ->
      $scope.order.order_items = _.reject($scope.order.order_items, (order_item) ->
        order_item.selected)

    $scope.checkDiscount = ->
      $scope.order.discount = if ($scope.order.discount > $scope.order.total) then $scope.order.total else $scope.order.discount
      $scope.total = $scope.order.total - $scope.order.discount

    $scope.checkStatus = ->
      $scope.order.status = switch
        when $scope.order.prepay >= $scope.total then $scope.statuses[2]
        when $scope.order.prepay > 0 then $scope.statuses[1]
        else $scope.statuses[0]

    $scope.selectRoll = (roll_id, price, name, left, suffix, code) ->
      if !_.some($scope.order.order_items, {roll_id: roll_id, price_sold: Number(price)})
        order_item = {roll_id: roll_id, price_sold: Number(price), amount_ordered: 1, name: name, left: Number(left), suffix: suffix, code: code, item_comment: ""}
        $scope.order.order_items.push order_item

]
