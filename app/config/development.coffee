
# Dependencies
express = require 'express'

# Application development configuration
module.exports = ->
    
    # Output sensible errors with the full stack trace
    @use express.errorHandler(
        dumpExceptions: true
        showStack: true
    )
