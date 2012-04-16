
# Dependencies
express = require 'express'
hulk = require 'hulk-hogan'

# Application default configuration
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
    
    # Allow parsing of request bodies and '_method' parameters
    @use express.bodyParser()
    @use express.methodOverride()
    
    # Mount application routes
    @use @router
