m = angular.module("directives.drag_container")

m.directive "dragContainer", ->
  controller: "DragContainerController"
  restrict: "E"
  scope: {}
  template: templates["directives/drag_container"]
  link: (scope, $el) ->
    $el.on("mouseup", (event) ->
      scope.deselect()
    )

    $el.on("mousemove", (event) ->
      # if there is a currently selected element
      # then record position of mouse
      # console.log event.pageX, event.pageY
    )
