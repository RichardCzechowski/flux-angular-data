m = angular.module("directives.trash")

m.directive "trash", ->
  controller: "TrashController"
  restrict: "E"
  scope: {}
  template: templates["directives/trash"]
  link: (scope, $el) ->
    $el.on("mousemove", (event) ->
      if scope.currentElement
        scope.deleteElement(scope.currentElement)
    )
