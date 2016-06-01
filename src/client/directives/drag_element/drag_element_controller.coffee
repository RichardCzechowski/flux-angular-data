m = angular.module("directives.drag_element")

m.controller "DragElementController", (
    $scope
    DatafluxEvent
    DragModelActions
    DragModelStore
  )->

    $scope.select = (even) ->
      console.log "selected", $scope.modelId
      DragModelActions.select($scope.modelId, event)
