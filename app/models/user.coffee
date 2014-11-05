`import DS from 'ember-data'`

User = DS.Model.extend
  userName: DS.attr 'string'

  repositories: DS.hasMany 'repository', async: true


`export default User`
