define(
  [
  	'jQuery'
  	'backbone'
  	'libs/mustache'
  	'text!templates/submitTest.html'
  	'testSession'
  ]
  ($, Backbone, Mustache, submitTestTemplate, TestSession) ->
    class SubmitTestView extends Backbone.View
      events: ->
        "click .startButton" : "startAgainClicked"

      initialize: ->
        if not TestSession.current()
          window.location = '/'
          return

        @collection = TestSession.current().sessionQuestions

      render: ->
        questions = @collection.models
        viewModel = 
          score: @collection.getScorePercentage()
          questions: @collection.toJSON()

        i = 1
        for question in viewModel.questions
          question.questionNumber = i
          i++

        html = Mustache.render(submitTestTemplate, viewModel)
        @$el.append(html)

      startAgainClicked: ->
        window.location = '/'

)