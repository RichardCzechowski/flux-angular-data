m = angular.module("directives.trash")

m.controller "TrashController", (
    $scope
    DatafluxEvent
    CurrentElementModelStore
    ElementsModelActions
  ) ->
    CurrentElementModelStore.$listen (event, id) ->
      return unless event is DatafluxEvent.change
      $scope.currentElement = CurrentElementModelStore.get()

    $scope.deleteElement = (id) ->
      ElementsModelActions.delete(id)
