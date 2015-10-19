angular.module('storeApp').factory 'rollsFactory', [
  '$http'
  ($http) ->
    o =
      rolls: []

    o.getAll = ->
      $http.get('/rolls.json').success (data) ->
        angular.copy data, o.rolls
        return

    o.get = (id) ->
      $http.get('/rolls/' + id + '.json').then (res) ->
        res.data

    o.add = (roll, arrival) ->
      $http.post('/rolls.json', {roll: roll, arrival: arrival}).then (res) ->
        res.data

    o.delete = (id) ->
      $http.delete('/rolls/' + id + '.json').then (res) ->
        res.data

    o
]
