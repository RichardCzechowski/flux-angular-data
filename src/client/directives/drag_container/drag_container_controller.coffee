m = angular.module("directives.drag_container")

m.controller "DragContainerController", (
    $scope
    DatafluxEvent
    DragModelActions
    DragModelStore
  )->

    $scope.elements = []

    DragModelStore.$listen (event, id) ->
      return unless event is DatafluxEvent.change
      $scope.elements = DragmModelStore.getAll()


    $scope.deselect = (even) ->
      console.log "deselected", "replace with current model"
      DragModelActions.select($scope.modelId, event)
