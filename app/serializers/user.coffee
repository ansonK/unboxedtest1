`import DS from 'ember-data'`

UserSerializer = DS.JSONSerializer.extend

  normalize: (type, hash) ->
    {
      id: hash.login,
      userName: hash.login,
      links:
        repositories: hash.repos_url
    }

`export default UserSerializer`
