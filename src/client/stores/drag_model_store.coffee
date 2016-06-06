m = angular.module 'stores'

m.factory "DragModelActions", (Reflux)->
  actions = Reflux.createActions ['create', 'select', 'deselect']
  actions = Reflux.logActions 'DragModelActions', actions
  return actions


m.factory 'DragModelStore', (
  DatafluxEvent
  DragModel
  DragModelActions
  Reflux
)->

  Reflux.createStore

    init: ->
      @listen (event, id)=>
        return unless event is DatafluxEvent.change
         @onCreate()

    listenables: DragModelActions

    # Public Methods
    getAll: ->
      return (model.toProxy() for model in DragModel.getAll())

    get: (id)->
      return DragModel.get(id)?.toProxy() or null

    # Action Methods ᕙ༼ຈل͜ຈ༽ᕗ
    onCreate: () ->
      DragModel.create()
        .then (model)->
          console.log model
        .catch (error)->
          console.log 'fail'

    onSelect: (id) ->

    onDeselect: (id) ->
