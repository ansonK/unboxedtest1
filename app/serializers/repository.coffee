`import DS from 'ember-data'`

RepositorySerializer = DS.JSONSerializer.extend

  normalize: (type, hash) ->
    {
      id: hash.id,
      name: hash.name,
      fullName: hash.full_name,
      language: hash.language
    }

`export default RepositorySerializer`
