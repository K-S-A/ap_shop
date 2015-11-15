"use strict"

angular.module('storeApp').factory 'orderItems', [
  '$http'
  ($http) ->
    o =
      order_items: []

    o.getAll = ->
      $http.get('/order_items.json').success (data) ->
        angular.copy data, o.order_items

    o.addReceipt = (index) ->
      item = o.order_items[index]
      receipt =
        order_item_id: item.id
        receipt_amount: item.amount_ordered
        receipt_date: new Date().toISOString().split('T')[0]
      $http.post('/store_receipts.json', {store_receipt: receipt}).success (data) ->
        o.order_items[index]["store_receipt"] = data

    o
]
