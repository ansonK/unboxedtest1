`import Ember from 'ember'`

UserRoute = Ember.Route.extend
  
  model: (params) ->
    # user = @store.createRecord 'user', id: 'ansonK', userName: 'ansonK'
    # @store.createRecord 'repository', name: 'test', language: 'Ruby', user: user

    @store.find 'user', params.userName

  afterModel: (model) ->
    if Ember.isEmpty model.get('repositories')
      model.reload()

`export default UserRoute`
