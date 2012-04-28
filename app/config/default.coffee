
# Dependencies
browserify = require 'browserify'
express = require 'express'
hulk = require 'hulk-hogan'

# Application default configuration
#
# This is loaded before either of the
# environment-specific configurations.
module.exports = ->
    baseDir = @set 'baseDir'

    # The port the application should run on
    @set 'port', 3000

    # Register hulk-hogan (mustache) views
    @register '.html', hulk

    # Set the view directory and default options
    @set 'views', baseDir + '/app/views'
    @set 'view engine', 'html'
    @set 'view options',
        layout: 'layouts/default'
        title: 'Untitled Page'

    # Set the app's public directory
    @use express.static(baseDir + '/public')

    # Set up client-side CoffeeScript compilation with browserify
    browserScriptBundle = require('browserify')(baseDir + '/client.coffee')
    @use browserScriptBundle
    
    # Allow parsing of request bodies and '_method' parameters
    @use express.bodyParser()
    @use express.methodOverride()

    # Enable cookies
    @use express.cookieParser()
    
    # Mount application routes
    @use @router
