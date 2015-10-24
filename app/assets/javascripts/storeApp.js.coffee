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
      controller: 'TextilesCtrl'
      resolve: textilePromise: [
        'textiles'
        (textiles) ->
          textiles.getAll()
      ]).state('newOrder',
      url: '/newOrder'
      views:
        '':
          templateUrl: 'orders/_form.html'
          controller: 'OrdersCtrl'
        'searchForm@newOrder':
          templateUrl: 'textiles/_index.html'
          controller: 'TextilesCtrl')
    $urlRouterProvider.otherwise 'textiles'
    return
]
