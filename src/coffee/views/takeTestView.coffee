define(
  [
  	'jQuery'
  	'backbone'
  	'libs/mustache'
  	'views/questionView'
  	'views/confirmDialogView'
  	'text!templates/takeTest.html'
  	'testSession'
  ]
  ($, Backbone, Mustache, QuestionView, ConfirmDialogView, takeTestTemplate, TestSession) ->
    class TakeTestView extends Backbone.View
      initialize: ->
        self = @
        @collection = TestSession.current().sessionQuestions

        @currentQuestion = 0
        @questionViews = []
        questionViews = @questionViews

        totalQuestions = @collection.length
        $.each(@collection.models, (i, question) ->
          questionViews.push(new QuestionView(
          	model: question
          	className: 'viewportPart'
          	questionNumber: i
          	totalQuestions: totalQuestions
          	prevClicked: -> (self.rewind())
          	nextClicked: -> (self.advance())
          	finishClicked: ->
          	  new ConfirmDialogView().render()
          ))
        )

      render: ->
        questions = @collection.models
        html = Mustache.render(takeTestTemplate)
        @$el.append(html)

        @viewportContainer = @$el.find('.viewportContainer')
        for questionView in @questionViews
          @viewportContainer.append(questionView.render().el)

        parts = @viewportContainer.find('.viewportPart')
        if parts.length == 0
          return

        @partWidth = $(parts[0]).width()
        @viewportContainer.width(@partWidth * parts.length)

      advance: ->
      	@currentQuestion += 1
      	@moveTo(@currentQuestion)

      rewind: ->
      	@currentQuestion -= 1
      	@moveTo(@currentQuestion)

      moveTo: (questionNumber) ->
      	@viewportContainer.animate(
      		"left": -1 * questionNumber * @partWidth
      		350
      	)
)