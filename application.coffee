
# Dependencies
express = require 'express'

# Create a the application server
app = express.createServer()

# Default route
app.get '/', (request, response) ->
    response.send 'Hello World!'

# Run the application
app.listen 3000
console.log 'Express server listening on port %d in %s mode', app.address().port, app.settings.env
