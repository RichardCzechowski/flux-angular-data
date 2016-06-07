m = angular.module 'stores'

m.factory "CurrentElementModelActions", (Reflux)->
  actions = Reflux.createActions ['set', 'delete']
  actions = Reflux.logActions 'CurrentElementModelActions', actions
  return actions


m.factory 'CurrentElementModelStore', (
  DatafluxEvent
  CurrentElementModel
  CurrentElementModelActions
  Reflux
)->

  Reflux.createStore

    init: ->
      @_current_element = null

    listenables: CurrentElementModelActions

    # Public Methods
    get: ->
      return @_current_element or null

    # Action Methods ᕙ༼ຈل͜ຈ༽ᕗ
    onSet: (id) ->
      @_current_element = id
      @trigger DatafluxEvent.change, id

    onDelete: () ->
      @_current_element = null
      @trigger DatafluxEvent.change
