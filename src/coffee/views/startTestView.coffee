define(
  ['backbone', 'text!templates/start.html']
  (Backbone, startTestTemplate) ->
    class StartTestView extends Backbone.View
      render: ->
        @$el.append(startTestTemplate)

      events: 'click .startbutton': 'startTest'

      startTest: ->
      	window.location = '/#/test'

)