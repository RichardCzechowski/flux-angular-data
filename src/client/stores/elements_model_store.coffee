m = angular.module 'stores', []

m.factory 'ElementsModelActions', (Reflux)->
  actions = Reflux.createActions ['loadAll', 'create', 'update', 'delete']
  actions = Reflux.logActions 'ElementsModelActions', actions
  return actions

m.factory 'ElementsModelStore', (
  DatafluxEvent
  ElementsModel
  Reflux
  ElementsModelActions
)->

  Reflux.createStore

    init: ->
      @listen (event, id)=>
        return unless event is DatafluxEvent.change

    listenables: ElementsModelActions

    # Public Methods ###############################################################################

    getAll: ->
      return (model.toProxy() for model in ElementsModel.getAll())

    get: (id)->
      return ElementsModel.get(id)?.toProxy() or null

    # Action Methods ###############################################################################

    onCreate: (params={})->
      params.isDone ?= false
      params.text ?= ""

      ElementsModel.create params
        .then (model)=>
          console.log "created ", model
          @trigger DatafluxEvent.create, model.id
          @trigger DatafluxEvent.change
        .catch (error)->
          console.error "Could not create: ", error

    onDelete: (id)->
      ElementsModel.destroy id
        .then =>
          console.log "deleted #{id}"
          @trigger DatafluxEvent.delete, id
          @trigger DatafluxEvent.change
        .catch (error)->
          console.error "Could not create: ", error

    onLoadAll: ->
      ElementsModel.findAll()
        .then (models)=>
          console.log "loaded all"
          @trigger DatafluxEvent.change
        .catch (error)->
          console.error "Could not load all: ", error

    onUpdate: (proxy)->
      return unless proxy.checkDirty()

      params = proxy.toHash()
      delete params.id

      ElementsModel.update proxy.id, params
        .then (model)=>
          console.log "updated ", model
          @trigger DatafluxEvent.update, model.id
          @trigger DatafluxEvent.change
        .catch (error)->
          console.error "Could not update: ", error
