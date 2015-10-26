angular.module('storeApp').controller 'OrdersCtrl', [
  '_'
  '$scope'
  '$state'
  '$log'
  'textiles'
  'rollsFactory'
  (_, $scope, $state, $log, textiles, rollsFactory) ->
    $scope.roll = {}
    $scope.statuses = [
      'unconfirmed'
      'prepaid'
      'full payment'
      'processed'
      'ready'
      'delivered'
      'canceled']
    $scope.addForm=
      visible: false
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
        {"roll_id":6,"price_sold":99.9,"name":"Textile3","left":1.0,"suffix":"a","code":"150577","item_comment":"", "amount_ordered": 1}
        {"roll_id":3,"price_sold":999.99,"name":"Textile1","left":22.4,"suffix":"b","code":"150579","item_comment":"", "amount_ordered": 1}]
    $scope.total = _.reduce($scope.order.order_items, (memo, order_item)->
        memo + order_item.amount_ordered * order_item.price_sold
      0) - $scope.order.discount

    $scope.updateTotal = ->
      $scope.order.total = Math.round(_.reduce($scope.order.order_items, (memo, order_item)->
        if !order_item.amount_ordered then order_item.amount_ordered = order_item.left
        if !order_item.price_sold then order_item.price_sold = 0.01
        memo + order_item.amount_ordered * order_item.price_sold
      0) * 100) / 100
      $scope.total = $scope.order.total - $scope.order.discount

    $scope.addItem = ->
      $scope.addForm.visible = true

    $scope.resetForm = ->
      $state.reload()

    $scope.clearItems =->
      $scope.order.order_items = []

    $scope.removeItem = ->
      $scope.order.order_items = _.reject($scope.order.order_items, (order_item) ->
        order_item.selected)

    $scope.checkDiscount = ->
      $scope.order.discount = if ($scope.order.discount > $scope.order.total) then $scope.order.total else $scope.order.discount
      $scope.updateTotal()

    $scope.selectRoll = (roll_id, price, name, left, suffix, code) ->
      if !_.some($scope.order.order_items, {roll_id: roll_id, price_sold: price})
        $scope.order.order_items.push {roll_id: roll_id, price_sold: Number(price), amount_ordered: 1, name: name, left: Number(left), suffix: suffix, code: code, item_comment: ""}
        $scope.addForm.visible = false
        $scope.updateTotal()
]
