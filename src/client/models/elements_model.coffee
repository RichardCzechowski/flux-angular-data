m = angular.module 'models'

m.factory 'ElementsModel', (
  DS
  ModelProxy
)->

  ElementsModel = DS.defineResource

    name: 'elements'

    fields: [
      'id'
    ]

    methods:

      toProxy: ->
        return new ModelProxy this, fields:ElementsModel.fields

m.run (ElementsModel)-> # force model to load
