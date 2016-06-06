m = angular.module("directives.add_button")

m.directive "addButton", ->
  controller: "AddButtonController"
  restrict: "E"
  scope: {}
  template: templates["directives/add_button"]
