m = angular.module("directives.add_button")

m.controller "AddButtonController", (
    $scope
    DatafluxEvent
    ElementsModelActions
  ) ->
    $scope.addElement = ->
      ElementsModelActions.create()
