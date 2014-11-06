`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @resource 'users', path: '/', ->
    @resource 'user', path: '/users/:userName'

  @resource 'users', path: '/users'

`export default Router`
