"use strict"

angular.module('storeApp').directive 'showValidation', [
  '_'
  '$log'
  (_, $log) ->
    restrict: 'A'
    require: '^form'
    link: (scope, el, attrs, formCtrl) ->
      inputEl = el[0].querySelector("[name]")
      inputNgEl = angular.element(inputEl)
      inputName = inputNgEl.attr("name")
      inputNgEl.bind "blur keyup", ->
        el.toggleClass("has-error", formCtrl[inputName].$invalid).toggleClass "has-success", formCtrl[inputName].$valid
        el.find("span").eq(0).toggleClass("glyphicon-remove", formCtrl[inputName].$invalid).toggleClass "glyphicon-ok", formCtrl[inputName].$valid

]
