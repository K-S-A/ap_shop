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
      ])

    $urlRouterProvider.otherwise 'textiles'
    return
]
