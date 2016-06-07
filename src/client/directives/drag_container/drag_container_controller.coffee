m = angular.module("directives.drag_container")

m.controller "DragContainerController", (
    $scope
    DatafluxEvent
    CurrentElementModelActions
    CurrentElementModelStore
    ElementsModelActions
    ElementsModelStore
  )->

    ElementsModelStore.$listen (event, id) ->
      return unless event is DatafluxEvent.change
      $scope.elements = ElementsModelStore.getAll()

    CurrentElementModelStore.$listen (event, id) ->
      return unless event is DatafluxEvent.change
      $scope.currentElement = CurrentElementModelStore.get()

    CurrentElementModelStore.get()

    $scope.deselect = (event) ->
      if helpers.collision($("##{$scope.currentElement}"), $("trash"))
        ElementsModelActions.delete($scope.currentElement)
      CurrentElementModelActions.delete($scope.currentElement)

    $scope.isSelected = (id) ->
      CurrentElementModelStore.get() == id

    $scope.setElementPosition = (event) ->
      proxy = ElementsModelStore.get($scope.currentElement)
      return unless proxy?
      proxy.xPos = event.pageX
      proxy.yPos = event.pageY
      ElementsModelActions.update(proxy)

