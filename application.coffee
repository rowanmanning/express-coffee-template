
# Dependencies
express = require 'express'

# Create a the application server
app = express.createServer()

# App configuration
app.set 'root', __dirname
app.configure require('./app/config/default')
app.configure 'development', require('./app/config/development')
app.configure 'production', require('./app/config/production')

# Default route
app.get '/', (request, response) ->
    response.render 'index',
        title: 'Home'
        thing: 'World'

# Run the application
app.listen 3000
console.log 'Express server listening on port %d in %s mode', app.address().port, app.settings.env
