"use strict"

angular.module('storeApp').factory 'orders', [
  '$http'
  ($http) ->
    o =
      orders: []
      order:
        number: null
        order_date: new Date().toISOString().split('T')[0]
        customer: ""
        order_comment: ""
        customer_phone: ""
        status: 'unconfirmed'
        prepay: 0
        discount: 0
        order_items: [
          {"roll_id":5,"price_sold":99.9,"name":"Textile3","left":1.0,"suffix":"a","code":"150577","item_comment":"", "amount_ordered": 1}
          {"roll_id":3,"price_sold":999.99,"name":"Textile1","left":22.4,"suffix":"b","code":"150579","item_comment":"", "amount_ordered": 1}]
      statuses: [
        'unconfirmed'
        'prepaid'
        'full payment'
        'processed'
        'ready'
        'delivered'
        'canceled']

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
