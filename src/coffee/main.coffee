require.config
  paths:
    jQuery: 'libs/jquery'
    underscore: 'libs/underscore'
    backbone: 'libs/backbone'

require(
  ['app', 'jQuery', 'underscore', 'backbone']
  (app) -> 
    app.initialize()
)