"use strict"

angular.module('storeApp').factory 'textiles', [
  '$http'
  '$log'
  ($http, $log) ->
    o =
      textiles: []
      roll: {}
      arrival: {}
    o.obj =
      code: null
      name: null
      suffix: "*"
      searches: []

    o.searchTextile = ->
      $http.get('/textiles.json', params: {code: o.obj.code, name: o.obj.name}).success (data) ->
        data = o.rollLeft(data)
        angular.copy data, o.textiles
        o.addSearch()
        o.roll.textile_id = false

    o.rollLeft = (data) ->
      _.each(data, (textile) ->
        _.each(textile.rolls, (roll) ->
          roll.left = _.reduce(roll.store_receipts, (memo, store_receipt) ->
            memo - store_receipt.receipt_amount
          roll.total)
          roll.sold = roll.total - roll.left))

    o.addSearch = ->
      search = {code: o.obj.code, name: o.obj.name}
      if o.textiles.length isnt 0 and !_.some(o.obj.searches, search)
        o.obj.searches.push search
        if o.obj.searches.length > 10 then o.obj.searches.shift()

    o.repeatSearch = ($index) ->
      search = o.obj.searches[$index]
      o.obj.code = search.code
      o.obj.name = search.name

    o.removeSearch = ($index) ->
      o.obj.searches.splice($index, 1)

    o.resetForm = (textile) ->
      o.roll.textile_id = textile.new = if textile.new then null else textile.id
      o.roll.suffix = if textile.rolls.length is 0 then ""
      else
        suffixes = _.map(textile.rolls, (roll) ->
          roll.suffix)
        _.difference("abcdefghijklmnopqrstuvwxyz".split(''), suffixes)[0]
      o.arrival = {}

    o.addRoll = (textile, roll) ->
      textile.rolls.push roll

    o.deleteRoll = (id, textile) ->
      textile.rolls = _.reject(textile.rolls, (roll) ->
        roll.id is id)

    o
]
