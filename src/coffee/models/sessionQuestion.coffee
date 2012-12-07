define(
  [
  	'backbone',
  	'underscore'
  ]
  (Backbone, _) ->
    class SessionQuestion extends Backbone.Model
      toJSON: -> 
        self = @
        attrs = {}

        _.extend(attrs, self.attributes)
        attrs.question = self.get('question').toJSON()
        attrs.answer = self.get('answer').toJSON()
        attrs.isCorrect = self.isCorrect()

        return attrs

      isCorrect: ->
        return @get('answer').get('selected') == @get('response')

      validate: (attrs)->
        attrs = attrs ? @attributes
        if attrs.response?
          return undefined
        else
          return [
              "Please answer the question"
          ]


    return SessionQuestion
)