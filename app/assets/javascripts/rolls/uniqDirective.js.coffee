angular.module('storeApp').directive 'ensureUnique', [
  '_'
  'textiles'
  (_, textiles) ->
    require: 'ngModel'
    link: (scope, ele, attrs, c) ->
      scope.$watch attrs.ngModel, ->
        keyProperty = scope.$eval(attrs.ensureUnique)
        val = !_.some keyProperty.rolls, (roll) ->
          roll.suffix is c.$modelValue.toLowerCase()
        c.$setValidity('uniq', val)

]
