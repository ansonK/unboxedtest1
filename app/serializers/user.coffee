`import DS from 'ember-data'`

UserSerializer = DS.JSONSerializer.extend

  normalize: (type, hash) ->
    {
      id: hash.login,
      userName: hash.login,
      links:
        repositories: hash.repos_url
    }

  # JSONSerializer does not implement pushPayload
  # Copy from RESTSerializer and simplify a bit
  pushPayload: (store, rawPayload) -> 
    payload = @normalizePayload(rawPayload)

    typeName = 'user'
    type = store.modelFor(typeName)
    typeSerializer = store.serializerFor(type)

    # jshint loopfunc:true
    normalizedArray = Ember.ArrayPolyfills.map.call(Ember.makeArray(rawPayload), (hash) ->
      typeSerializer.normalize(type, hash)
    , @)

    store.pushMany typeName, normalizedArray
 
`export default UserSerializer`
