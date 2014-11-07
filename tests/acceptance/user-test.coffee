`import Ember from 'ember'`
`import startApp from '../helpers/start-app'`

App = null
mockUser = null

module 'Acceptance: User',
  setup: ->
    App = startApp()

    mockUser = ->
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

  teardown: ->
    $.mockjaxClear()
    Ember.run App, App.destroy

test 'shows the users github name as the title', ->
  mockUser()
  visit '/users/wycats'

  andThen ->
    equal find('.user-info h2').text(), 'wycats'


test 'shows the users favourite language', ->
  mockUser()
  visit '/users/wycats'

  andThen ->
    ok find('.user-info p').text().indexOf('has Ruby as their favourite language') > -1


test 'shows a list of the users repositories', ->
  mockUser()
  visit '/users/wycats'

  andThen ->
    equal find('.user-info li.repo').length, 1
    ok find('.user-info li.repo:first ').text().indexOf('Test Repo') > 0
    ok find('.user-info li.repo:first ').text().indexOf('Ruby') > 0


test 'with an invalid username displays the error page', ->
  stubEndpointForHttpRequest('GET', 'https://api.github.com/users/wycats', null, null, 404)

  visit '/users/wycats'

  andThen ->
    equal currentRouteName(), 'error'