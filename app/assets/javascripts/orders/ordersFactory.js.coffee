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
        _.each(data, (order) ->
          order.total = _.reduce(order.order_items, (memo, order_item) ->
            memo + order_item.amount_ordered * order_item.price_sold
          0))
        angular.copy data, o.orders

    o
]
