`import DS from 'ember-data'`

ApplicationAdapter = DS.RESTAdapter.extend
  host: 'https://api.github.com'

`export default ApplicationAdapter`
