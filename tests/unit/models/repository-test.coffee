`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'repository', 'Repository', {
  # Specify the other units that are required for this test.
  needs: ['model:user']
}

test 'it exists', ->
  model = @subject()
  # store = @store()
  ok !!model
