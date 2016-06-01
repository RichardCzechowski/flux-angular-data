m = angular.module("directives.drag_container")

m.directive "dragContainer", ->
  controller: "DragContainerController"
  restrict: "A"
  scope: {}
  link: (scope, $el) ->
    $el.on("mouseup", (event) ->
      scope.deselect()
    )

    $el.on("mousemove", (event) ->
      # if there is a currently selected element
      # then record position of mouse
      # console.log event.pageX, event.pageY
    )
