m = angular.module("directives.drag_element")

m.controller "DragElementController", (
    $scope
    DatafluxEvent
    CurrentElementModelActions
    CurrentElementModelStore
    ElementsModelStore
  )->

    ElementsModelStore.$listen (event, id)->
      return unless event is DatafluxEvent.change
      return unless id == $scope.id
      $scope.element = ElementsModelStore.get(id)
      console.log "getting element", id

    $scope.select = ->
      console.log "selected", $scope.id
      CurrentElementModelActions.set($scope.id)
