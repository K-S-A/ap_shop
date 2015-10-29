angular.module('storeApp').factory 'textiles', [
  '$http'
  ($http) ->
    o =
      textiles: []
      searches: []

    o.getAll = (code, name) ->
      $http.get('/textiles.json', params: {code: code, name: name}).success (data) ->
        angular.copy data, o.textiles
        if data.length isnt 0 and !_.some(o.searches, {code: code, name: name})
          o.searches.push {code: code, name: name}
          if o.searches.length > 10 then o.searches.shift()
        return

    o
]
