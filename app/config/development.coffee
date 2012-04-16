
# Dependencies
express = require 'express'

# Application development configuration
module.exports = ->
    
    @use express.errorHandler(
        dumpExceptions: true
        showStack: true
    )
