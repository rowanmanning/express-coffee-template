
# Dependencies
express = require 'express'

# Application production configuration
module.exports = ->
    
    # Simple error reporting - should display a 500 page
    @use express.errorHandler()
