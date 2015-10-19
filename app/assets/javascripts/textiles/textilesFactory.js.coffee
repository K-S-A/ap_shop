angular.module('storeApp').factory 'textiles', [
  '$http'
  ($http) ->
    o =
      textiles: []

    o.getAll = (code = null) ->
      $http.get('/textiles.json', params: {code: code}).success (data) ->
        angular.copy data, o.textiles
        return

    o
]
