`import Ember from 'ember'`

UsersController = Ember.ArrayController.extend
  newUsername: ''
  errorMessage: null

  actions:
    userNameOnKey: (event) ->
      if event.keyCode == 8 || Ember.isEmpty(@get('newUsername')) # backspace or empty input
        @set 'errorMessage', null

      if event.keyCode == 13
        @send 'createUser'

    createUser: ->

        @store.find('user', @get('newUsername')).then (user) =>

          @set 'newUsername', ''
          @set 'errorMessage', null
          @transitionToRoute 'user', user

        , (error) =>
          console.log error
          @set 'errorMessage', 'does not appear to be a valid github username'

`export default UsersController`
