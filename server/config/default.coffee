
# Dependencies
browserify = require 'browserify'
express = require 'express'
hulk = require 'hulk-hogan'

# Server default configuration
#
# This is loaded before either of the
# environment-specific configurations.
module.exports = ->
  baseDir = @set 'baseDir'
  
  # The port the server should run on
  @set 'port', 3000
  
  # Register hulk-hogan (mustache) views
  @register '.html', hulk
  
  # Set the view directory and default options
  @set 'views', baseDir + '/server/views'
  @set 'view engine', 'html'
  @set 'view options',
    layout: 'layouts/default'
    title: 'Untitled Page'
  
  # Set the server's public directory
  @use express.static(baseDir + '/public')
  
  # Set up client-side CoffeeScript compilation with browserify
  browserScriptBundle = browserify
    require: baseDir + '/client/bootstrap.coffee'
    mount: '/script/main.js'
  @use browserScriptBundle
  
  # Allow parsing of request bodies and '_method' parameters
  @use express.bodyParser()
  @use express.methodOverride()
  
  # Enable cookies
  @use express.cookieParser()
  
  # Mount application routes
  @use @router
  