define(
  [
  	'collections/testQuestionCollection'
  	'collections/testAnswerCollection'
  	'models/sessionQuestion'
  	'collections/sessionQuestionCollection'
  ]
  (
  	TestQuestionCollection
  	TestAnswerCollection
  	SessionQuestion
  	SessionQuestionCollection
  ) ->
    currentSession = null

    tryInit = ->
      if currentSession.questions.length > 0 and currentSession.answers.length > 0
      	currentSession.sessionQuestions = new SessionQuestionCollection()
      	for question in currentSession.questions.models
      	  answer = currentSession.answers.get(question.id)
      	  currentSession.sessionQuestions.add(new SessionQuestion(
      	  	question: question
      	  	answer: answer
      	  ))

    createSession = ->
      currentSession =
      	questions: new TestQuestionCollection()
      	answers: new TestAnswerCollection()
      	sessionQuestions: new SessionQuestionCollection()

      currentSession.questions.fetch( (questions) ->
      	tryInit()
      )

      currentSession.answers.fetch( (answers) ->
      	tryInit()
      )

    initialize: () ->
      createSession()
    current: () ->
      currentSession
    reset: () ->
      createSession()
)