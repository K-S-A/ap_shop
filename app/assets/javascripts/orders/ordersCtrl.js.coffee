angular.module('storeApp').controller 'OrdersCtrl', [
  '_'
  '$scope'
  '$state'
  'textiles'
  'rollsFactory'
  (_, $scope, $state, textiles, rollsFactory) ->
    $scope.statuses = ['unconfirmed', 'prepaid', 'full payment', 'processed', 'ready', 'delivered', 'canceled']
    $scope.order =
      number: null
      order_date: new Date().toISOString().split('T')[0]
      customer: ""
      order_comment: ""
      customer_phone: ""
      status: 'unconfirmed'
      prepay: 0
      discount: 4
      total: 100
    $scope.total = $scope.order.total - $scope.order.discount

    $scope.checkDiscount = ->
      $scope.order.discount = if ($scope.order.discount > $scope.order.total) then $scope.order.total else $scope.order.discount
      $scope.total = $scope.order.total - $scope.order.discount

]
