m = angular.module 'stores'

m.factory "CurrentElementModelActions", (Reflux)->
  actions = Reflux.createActions ['set']
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
      return CurrentElementModel.getAll()?[0]?.toProxy() or null

    # Action Methods ᕙ༼ຈل͜ຈ༽ᕗ
    onSet: (id)->
      # proxy = '{"id": id}'
      # console.log("SETTTING", id)
      # CurrentElementModel.update proxy
      #   .then (model)=>
      #     console.log "updated ", model
      #     @trigger DatafluxEvent.update, model.id
      #     @trigger DatafluxEvent.change
      #   .catch (error)->
      #     console.error "Could not update: ", error
