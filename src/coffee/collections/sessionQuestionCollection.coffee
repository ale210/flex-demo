define(
  [
  	'backbone'
    'models/sessionQuestion'
  ]
  (Backbone, SessionQuestion) ->
    class SessionQuestionCollection extends Backbone.Collection
      model: SessionQuestion
      getScorePercentage: ->
        correctAnswers = 0
        correctAnswers += 1 for question in @models when question.isCorrect()

        return Math.round(1000 * correctAnswers / @length) / 10
)