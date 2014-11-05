`import DS from 'ember-data'`

Repository = DS.Model.extend {
  name: DS.attr 'string'
  fullName: DS.attr 'string'
  language: DS.attr 'string'

  owner: DS.belongsTo 'user'
}

`export default Repository`
