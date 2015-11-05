"use strict"

angular.module('storeApp', [
  'ui.bootstrap'
  'ui.router'
  'templates'
  'underscore'
]).config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state('textiles',
      url: '/textiles'
      templateUrl: 'views/textiles/_index.html'
      controller: 'TextilesCtrl as vm')
    .state('newOrder',
      url: '/newOrder'
      templateUrl: 'views/orders/_form.html'
      controller: 'OrdersCtrl as vm')
    .state('orders',
      url: '/orders'
      templateUrl: 'views/orders/_index.html'
      controller: 'OrdersCtrl as vm'
      resolve: ordersPromise: [
        'orders'
        (orders) ->
          orders.getAll()])
    .state('editOrder',
      url: '/editOrder/:id'
      templateUrl: 'views/orders/_form.html'
      controller: 'OrdersCtrl as vm'
      resolve: orderPromise: [
        '$stateParams'
        'orders'
        ($stateParams, orders) ->
          orders.get $stateParams.id
      ])

    $urlRouterProvider.otherwise 'textiles'
    return
]
