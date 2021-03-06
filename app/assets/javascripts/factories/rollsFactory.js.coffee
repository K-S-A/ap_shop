"use strict"

angular.module('storeApp').factory 'rollsFactory', [
  '$http'
  ($http) ->
    o =
      rolls: []
    o.datePattern = new RegExp("^([1-9]|0[1-9]|[1-2]\\d|3[0-1])\\W([1-9]|0[1-9]|1[1-2])\\W(19|" + new Date().getFullYear().toString().slice(0,2) + ")\\d{2}$")

    o.getAll = ->
      $http.get('/rolls.json').success (data) ->
        angular.copy data, o.rolls
        return

    o.get = (id) ->
      $http.get('/rolls/' + id + '.json').then (res) ->
        res.data

    o.add = (roll) ->
      $http.post('/rolls.json', {roll: roll}).then (res) ->
        res.data = o.calcRoll(res.data)

    o.delete = (id) ->
      $http.delete('/rolls/' + id + '.json').then (res) ->
        res

    o.calcRoll = (roll) ->
      roll.left = _.reduce(roll.store_receipts, (memo, store_receipt) ->
        memo - store_receipt.receipt_amount
      roll.total)
      roll.sold = roll.total - roll.left
      roll

    o
]
