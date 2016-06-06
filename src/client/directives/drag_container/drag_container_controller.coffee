m = angular.module("directives.drag_container")

m.controller "DragContainerController", (
    $scope
    DatafluxEvent
    DragModelActions
    DragModelStore
  )->

    $scope.deselect = (even) ->
      console.log "deselected", "replace with current model"
      DragModelActions.deselect($scope.modelId, event)
