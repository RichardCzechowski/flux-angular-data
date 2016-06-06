m = angular.module 'models'

m.factory 'DragModel', (
  DS
  ModelProxy
)->

  DragModel = DS.defineResource

    name: 'drag'

    methods:

      toProxy: ->
        return new ModelProxy this

m.run (DragModel)-> # force model to load
