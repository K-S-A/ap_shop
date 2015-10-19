angular.module('storeApp').factory 'groupsFactory', [
  '$http'
  ($http) ->
    o =
      groups: []
      group: []

    o.getAll = ->
      $http.get('/groups.json').success (data) ->
        angular.copy data, o.groups
        return

    o.create = (group) ->
      $http.post('/groups.json', group).success (data) ->
        o.groups.push data
        return

    o.search = (name)->
      $http.get('/groupsearch/' + name + '.json').success (data) ->
        angular.copy data, o.groups
        return

    o
]
