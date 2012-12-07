define(
  [
    'jQuery'
    'backbone'
    'views/startTestView'
    'views/takeTestView'
    'views/submitTestView'
    'testSession'
  ]
  (
    $, 
    Backbone, 
    StartTestView, 
    TakeTestView, 
    SubmitTestView, 
    TestSession
  ) ->

    class MyRouter extends Backbone.Router
      routes:
        '': 'index'
        'test': 'test'
        'submit': 'submit'

      index: ->
        $('#wrapper').empty()
        view = new StartTestView(
          el: '#wrapper'
        )
        view.render()

      test: ->
        TestSession.reset()
        $('#wrapper').empty()
        view = new TakeTestView(
          el: '#wrapper'
        )
        view.render()

      submit: ->
        $('#wrapper').empty()
        view = new SubmitTestView(
          el: '#wrapper'
        )
        view.render()


    initialize: ->
      router = new MyRouter()
      Backbone.history.start()

      router
)