'use strict'

angular.module('storeApp').filter 'translate', [
  'translation'
  (translation)->
    (value, lang) ->
      if lang is 'en' then value else translation[lang][value]

]
