angular.module('storeApp').factory 'orders', [
  '$http'
  ($http) ->
    o =
      order: {}


    o.add = (order) ->
      $http.post('/orders.json', order).then (res) ->
        angular.copy res.data, o.order

    o
]
