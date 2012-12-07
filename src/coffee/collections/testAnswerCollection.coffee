define(
  [
  	'backbone'
    'models/testAnswer'
  ]
  (Backbone, TestAnswer) ->
    class TestAnswerCollection extends Backbone.Collection
      model: TestAnswer

      fetch: (success, error) ->
        @reset(
          [
            { "id": 1, "selected": true }
            { "id": 2, "selected": false }
            { "id": 3, "selected": true }
            { "id": 4, "selected": false }
          ]
        )

        success()

    return TestAnswerCollection
)