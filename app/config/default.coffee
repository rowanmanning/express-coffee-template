
# Dependencies
express = require 'express'
hulk = require 'hulk-hogan'

# Application default configuration
module.exports = ->
    
    # Register hulk-hogan (mustache) views
    @register '.html', hulk

    # Set the view directory
    @set 'views', @set('root') + '/app/views'

    # Set default view options
    @set 'view options',
        layout: 'layouts/default'
        title: 'Untitled Page'

    # Set the default view engine
    @set 'view engine', 'html'

    # Set the app's public directory
    @use express.static(@set('root') + '/public')
    
    # Allow parsing of request bodies and '_method' parameters
    @use express.bodyParser()
    @use express.methodOverride()
    
    # Mount application routes
    @use @router
