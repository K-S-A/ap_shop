angular.module('storeApp').factory 'textiles', [
  '$http'
  ($http) ->
    o =
      textiles: []
      searches: []

    o.getAll = (code, name) ->
      $http.get('/textiles.json', params: {code: code, name: name}).success (data) ->
        _.each(data, (textile) ->
          _.each(textile.rolls, (roll) ->
            roll.left = _.reduce(roll.store_receipts, (memo, store_receipt) ->
              memo - store_receipt.receipt_amount
            roll.total)
            roll.sold = roll.total - roll.left))
        angular.copy data, o.textiles
        if data.length isnt 0 and !_.some(o.searches, {code: code, name: name})
          o.searches.push {code: code, name: name}
          if o.searches.length > 10 then o.searches.shift()
        return

    o
]
