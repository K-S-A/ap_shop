angular.module('storeApp').controller 'OrdersCtrl', [
  '_'
  '$scope'
  '$state'
  'textiles'
  'rollsFactory'
  'translation'
  (_, $scope, $state, textiles, rollsFactory, translation) ->
    $scope.language = translation.language
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
      discount: 4
      total: 100
      order_items: [1,2]
    $scope.total = $scope.order.total - $scope.order.discount

    $scope.addItem = ->
      $scope.addForm.visible = true

    $scope.resetForm = ->
      $state.reload()

    $scope.clearItems =->
      $scope.order.order_items = []

    $scope.checkDiscount = ->
      $scope.order.discount = if ($scope.order.discount > $scope.order.total) then $scope.order.total else $scope.order.discount
      $scope.total = $scope.order.total - $scope.order.discount

    $scope.setLang = ->
      translation.language = $scope.language
]
