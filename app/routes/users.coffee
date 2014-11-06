`import Ember from 'ember'`

UsersRoute = Ember.Route.extend

  model: ->
    @store.all 'user'

`export default UsersRoute`
