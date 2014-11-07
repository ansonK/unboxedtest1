`import Ember from 'ember'`
`import startApp from '../helpers/start-app'`

App = null

module 'Acceptance: Users',
  setup: ->
    App = startApp()

  teardown: ->
    $.mockjaxClear()
    Ember.run App, App.destroy

test 'displays no users by default', ->
  visit '/users'

  andThen ->
    equal find('.users-list ul li').length, 0


test 'entering a valid github user adds the user to the list', ->
  user_response = {
    login: 'wycats',
    repos_url: 'https://api.github.com/users/wycats/repos'
  }
  repos_response = [{
    id: 1231,
    name: 'Test Repo',
    full_name: 'Test Repo',
    language: 'Ruby'
  }]
  stubEndpointForHttpRequest('GET', 'https://api.github.com/users/wycats', null, user_response, 200)
  stubEndpointForHttpRequest('GET', 'https://api.github.com/users/wycats/repos', null, repos_response, 200)

  visit '/users'

  andThen ->
    fillIn '.users-list input', 'wycats'
    click '.users-list button'

    andThen ->
      equal find('.users-list ul li').length, 1
      equal find('.users-list ul li').text(), 'wycats'
      equal find('.users-list input').val(), ''


test 'entering an invalid github username displays an error', ->
  stubEndpointForHttpRequest 'GET', 'https://api.github.com/users/asdadasdadsadada', null, null, 404

  visit '/users'

  andThen ->
    fillIn '.users-list input', 'asdadasdadsadada'
    click('.users-list button')

    andThen ->
      equal find('.users-list .error').length, 1
      equal find('.users-list input').val(), 'asdadasdadsadada'
