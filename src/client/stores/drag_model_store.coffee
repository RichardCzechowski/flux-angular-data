
m = angular.module 'stores', []

m.factory "DragModelActions", (Reflux)->
  actions = Reflux.createActions ['select', 'deselect']
  actions = Reflux.logActions 'DragModelActions', actions
  return actions


m.factory 'DragModelStore', (
  DatafluxEvent
  DragModel
  DragModelActions
  Reflux
)->

  Reflux.createStore

    listenables: DragModelActions

    # Public Methods
    getAll: ->
      return (model.toProxy() for model in DragModel.getAll())

    get: (id)->
      return DragModel.get(id)?.toProxy() or null

    # Action Methods ᕙ༼ຈل͜ຈ༽ᕗ
    onSelect: (id) ->

    onDeselect: (id) ->
