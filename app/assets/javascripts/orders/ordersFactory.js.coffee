angular.module('storeApp').factory 'orders', [
  '$http'
  ($http) ->
    o =
      order: {}
      orders: []

    o.add = (order) ->
      $http.post('/orders.json', order).then (res) ->
        angular.copy res.data, o.order

    o.getAll = ->
      $http.get('/orders.json').success (data) ->
        angular.copy data, o.orders

    o
]
