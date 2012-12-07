define(
  [
  	'jQuery'
  	'underscore'
  	'backbone'
  	'libs/mustache'
  	'text!templates/question.html'
  ]
  ($, _, Backbone, Mustache, questionTemplate) ->
    class QuestionView extends Backbone.View
      events:
        "click input[type=radio]": "answerClicked"
        "click .prev": "prevClicked"
        "click .next": "nextClicked"
        "click .finish": "finishClicked"

      render: ->
        viewModel = @model.toJSON()

        _.extend(viewModel,
          questionNumber: @options.questionNumber + 1
          totalQuestions: @options.totalQuestions
          isFirst: @options.questionNumber == 0
          isLast: @options.questionNumber == @options.totalQuestions - 1
        )

        html = Mustache.render(questionTemplate, viewModel)
        @$el.html(html)

        return @

      answerClicked: (e) ->
        if $(e.currentTarget).val() == "true"
          @model.set("response", true) 
        else if $(e.currentTarget).val() == "false"
          @model.set("response", false) 

      prevClicked: ->
        if @options.questionNumber == 0 
          return

        if @validateModel()
          @options.prevClicked()

      nextClicked: ->
        if @options.questionNumber == @options.totalQuestions - 1
          return

        if @validateModel()
          @options.nextClicked()

      finishClicked: ->
        if @options.questionNumber != @options.totalQuestions - 1
          return

        if @validateModel()
          @options.finishClicked()

      validateModel: ->
        validationResultsDiv = @$el.find('.validationResults')
        validationResultsDiv.empty()

        if @model.isValid()
          return true
        else 
          html = ''
          for message in @model.validate()
            html += "<div class='validationMessage'>#{message}</div>"
            validationResultsDiv.html(html)
          return false

)