
# Dependencies
browserify = require 'browserify'
express = require 'express'
hbs = require 'express-hbs'

# Server default configuration
#
# This is loaded before either of the
# environment-specific configurations.
module.exports = ->
    baseDir = @set 'baseDir'
    
    # The port the server should run on
    @set 'port', process.env.PORT || 3000
    
    # Handlebars templating
    @engine('hbs', hbs.express3(
        partialsDir: baseDir + '/server/view/partial'
        defaultLayout: baseDir + '/server/view/layout/default'
    ))

    @set 'view engine', 'hbs'
    @set 'views', baseDir + '/server/view'
        
    # Set the server's public directory
    @use express.static(baseDir + '/public')
    
    # Set up client-side CoffeeScript compilation with browserify
    browserScriptBundle = browserify
        require: baseDir + '/client/script/bootstrap.coffee'
        mount: '/script/main.js'

    @use browserScriptBundle
    
    # Allow parsing of request bodies and '_method' parameters
    @use express.bodyParser()
    @use express.methodOverride()
    
    # Enable cookies
    @use express.cookieParser('your secret here')
    
    # Mount application routes
    @use @router
