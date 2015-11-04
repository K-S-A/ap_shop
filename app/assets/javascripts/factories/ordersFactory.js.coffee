"use strict"

angular.module('storeApp').factory 'orders', [
  '_'
  '$http'
  (_, $http) ->
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
          order.total = o.calcTotal(order.order_items))
        angular.copy data, o.orders

    o.get = (id) ->
      $http.get('/orders/' + id + '.json').success (data) ->
        data.total = o.calcTotal(data.order_items)
        angular.copy data, o.order

    o.calcTotal = (order_items) ->
      _.reduce(order_items, (memo, order_item) ->
       memo + order_item.amount_ordered * order_item.price_sold
      0)

    o.updateTotal = ->
      o.order.total = Math.round(_.reduce(o.order.order_items, (memo, order_item)->
        memo + (order_item.amount_ordered ||= order_item.left) * (order_item.price_sold ||= 0.01)
      0) * 100) / 100

    o.removeItem = (remove_all) ->
      o.order.order_items = if remove_all
        []
      else
        _.reject(o.order.order_items, (order_item) ->
          order_item.selected)
      o.updateTotal()
      o.checkDiscount()

    o.checkDiscount = ->
      o.order.discount = if (o.order.discount > o.order.total) then o.order.total else Math.round(o.order.discount * 100) / 100

    o.checkStatus = ->
      o.order.status = switch
        when o.order.prepay >= o.order.total then o.statuses[2]
        when o.order.prepay > 0 then o.statuses[1]
        else o.statuses[0]

    o.selectRoll = (roll_id, price, name, left, suffix, code) ->
      if !_.some(o.order.order_items, {roll_id: roll_id, price_sold: price})
        order_item = {roll_id: roll_id, price_sold: price, amount_ordered: 1, name: name, left: left, suffix: suffix, code: code}
        o.order.order_items.push order_item

    o
]
