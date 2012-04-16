
# Dependencies
express = require 'express'

# Application default configuration
module.exports = ->
    
    # Set the app's public directory
    @use express.static(@set('root') + '/public')
    
    # Allow parsing of request bodies and '_method' parameters
    @use express.bodyParser()
    @use express.methodOverride()
    
    # Mount application routes
    @use @router
