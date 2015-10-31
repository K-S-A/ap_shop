'use strict'

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
      templateUrl: 'textiles/_index.html'
      controller: 'TextilesCtrl')
    .state('newOrder',
      url: '/newOrder'
      templateUrl: 'orders/_form.html'
      controller: 'OrdersCtrl')
    .state('orders',
      url: '/orders'
      templateUrl: 'orders/_index.html'
      controller: 'OrdersCtrl'
      resolve: ordersPromise: [
        'orders'
        (orders) ->
          orders.getAll()
      ])

    $urlRouterProvider.otherwise 'textiles'
    return
]
