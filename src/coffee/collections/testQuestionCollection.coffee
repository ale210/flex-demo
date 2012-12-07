define(
  [
  	'backbone'
    'models/testQuestion'
  ]
  (Backbone, TestQuestion) ->
    class TestQuestionCollection extends Backbone.Collection
      model: TestQuestion

      fetch: (success, error) ->
        @reset(
          [
            { "id": 1, "text": "Tim Berners-Lee invented the Internet." }
            { "id": 2, "text": "Dogs are better than cats." }
            { "id": 3, "text": "Winter is coming." }
            { "id": 4, "text": "Internet Explorer is the most advanced browser on Earth." }
          ]
        )

        success()

    return TestQuestionCollection
)