angular.module('storeApp').factory 'searchFactory', [
  '$http'
  ($http) ->
    o =
      rolls: []

    o.search = (code)->
      $http.get('/search/' + code + '.json').success (data) ->
        angular.copy data, o.rolls
        return

    o
]
