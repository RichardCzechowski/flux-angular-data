m = angular.module("directives.drag_container")

m.controller "DragContainerController", (
    $scope
    DatafluxEvent
    CurrentElementModelActions
    CurrentElementModelStore
    ElementsModelActions
    ElementsModelStore
  )->

    for i in [1..5]
      ElementsModelActions.create()

    ElementsModelStore.$listen (event, id) ->
      return unless event is DatafluxEvent.change
      $scope.elements = ElementsModelStore.getAll()

    CurrentElementModelStore.$listen (event, id) ->
      return unless event is DatafluxEvent.change
      $scope.currentElement = CurrentElementModelStore.get()

    CurrentElementModelStore.get()

    $scope.deselect = (event) ->
      CurrentElementModelActions.delete($scope.currentElement)

    $scope.isSelected = (id) ->
      CurrentElementModelStore.get() == id

    $scope.setElementPosition = (event) ->
      proxy = ElementsModelStore.get($scope.currentElement)
      proxy.xPos = event.pageX
      proxy.yPos = event.pageY
      ElementsModelActions.update(proxy)

