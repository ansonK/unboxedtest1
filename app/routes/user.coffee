`import Ember from 'ember'`

UserRoute = Ember.Route.extend
  
  model: (params) ->
    @store.find 'user', params.userName

`export default UserRoute`
