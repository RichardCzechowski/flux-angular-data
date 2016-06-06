m = angular.module("directives.drag_element")

m.controller "DragElementController", (
    $scope
    DatafluxEvent
    CurrentElementModelActions
    CurrentElementModelStore
  )->
    $scope.modelId = 42 #Test model id

    $scope.select = ->
      console.log "selected", $scope.modelId
      CurrentElementModelActions.set($scope.modelId)

    $scope.isSelected = ->
      $scope.modelId == CurrentElementModelStore.get()
