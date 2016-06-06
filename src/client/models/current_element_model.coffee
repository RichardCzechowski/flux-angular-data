m = angular.module 'models'

m.factory 'CurrentElementModel', (
  DS
  ModelProxy
)->

  CurrentElementModel = DS.defineResource

    name: 'currentElement'

    fields: [
      'id'
    ]

    methods:

      toProxy: ->
        return new ModelProxy this

m.run (CurrentElementModel)-> # force model to load
