`import Ember from 'ember'`

UserRoute = Ember.Route.extend
  
  model: (params) ->
    @store.find 'user', params.userName

  afterModel: (model) ->
    if Ember.isEmpty model.get('repositories')
      model.reload()

`export default UserRoute`
