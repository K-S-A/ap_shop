"use strict"

angular.module('storeApp', [
  'ui.bootstrap'
  'dndLists'
  'ui.router'
  'templates'
  'underscore'
  'Devise'
]).config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state('textiles',
      url: '/textiles'
      templateUrl: 'views/textiles/_index.html'
      controller: 'TextilesCtrl')
    .state('newOrder',
      url: '/newOrder'
      templateUrl: 'views/orders/_form.html'
      controller: 'OrdersCtrl')
    .state('orders',
      url: '/orders'
      templateUrl: 'views/orders/_index.html'
      controller: 'OrdersCtrl'
      resolve: ordersPromise: [
        'orders'
        (orders) ->
          orders.getAll()])
    .state('editOrder',
      url: '/editOrder/:id'
      templateUrl: 'views/orders/_form.html'
      controller: 'OrdersCtrl'
      resolve: order: [
        '$stateParams'
        'orders'
        ($stateParams, orders) ->
          orders.get $stateParams.id
      ])

    $urlRouterProvider.otherwise 'textiles'
    return
]
