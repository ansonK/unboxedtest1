`import Ember from 'ember'`

UserController = Ember.ObjectController.extend

  languageSummary: (->
    @get('repositories').map((repo) -> 
      repo.get('language')
    ).reduce((languages, language) ->
      if languages[language]
        languages[language] = languages[language] + 1
      else
        languages[language] = 1
      languages
    , {})

  ).property('repositories.@each')

  favouriteLanguage: (->
    # convert to an array of arrays
    list = $.map @get('languageSummary'), (v,k) -> [{ name: k, count: v}]

    if list.length > 0
      list.sort((a,b) -> b.count - a.count)[0].name

  ).property('languageSummary')

`export default UserController`
