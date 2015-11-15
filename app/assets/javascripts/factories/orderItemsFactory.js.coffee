"use strict"

angular.module('storeApp').factory 'orderItems', [
  '_'
  '$http'
  (_, $http) ->
    o =
      order_items: []

    o.getAll = ->
      $http.get('/order_items.json').success (data) ->
        angular.copy data, o.order_items

    o
]
