
# Dependencies
express = require 'express'

# Application production configuration
module.exports = ->
    
    @use express.errorHandler()
