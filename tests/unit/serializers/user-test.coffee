`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'serializer:user', 'UserSerializer', {
  # Specify the other units that are required for this test.
  # needs: ['serializer:foo']
}

test 'it exists', ->
  serializer = @subject()
  ok serializer

test 'normalize returns correct info', ->
  normalized_hash = @subject().normalize('user', {login: 'wycats', repos_url: 'http://a.url', notIncluded: true})
  deepEqual normalized_hash, { id: 'wycats', userName: 'wycats', links: { repositories: 'http://a.url' }}