define(
  [
    'jQuery'
    'backbone'
    'text!templates/confirmDialog.html'
  ]
  ($, Backbone, confirmDialogTemplate) ->
    class TakeTestView extends Backbone.View
      events:
        'click .yes': 'yesClicked'
        'click .no' : 'noClicked'

      render: ->
        @$el.html(confirmDialogTemplate)
        $('body').prepend(@$el)

      yesClicked: ->
        window.location = '/#/submit'
        @remove()

      noClicked: ->
        @remove()
)