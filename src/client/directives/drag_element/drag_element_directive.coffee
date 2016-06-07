m = angular.module("directives.drag_element")

m.directive "dragElement", ->
  controller: "DragElementController"
  restrict: "E"
  scope:
    id: "=elementId"
  template: templates["directives/drag_element"]
