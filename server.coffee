
# Dependencies
express = require 'express'

# Create a the application server
#
# This creates a server and exports it as a module
# which allows other files to get at the `app`
# variable if needed.
app = module.exports = express.createServer()

# App configuration
#
# `baseDir` is used to cache the base directory for
# files in other modules, this avoids having to work
# out where files are in relation to the current one.
#
# Each of the config files should export a function
# which will be used in `app.configure`. `this` in
# these functions will be `app` which makes for an
# intuitive way of writing configurations.
app.set 'baseDir', __dirname
app.configure require('./app/config/default')
app.configure 'development', require('./app/config/development')
app.configure 'production', require('./app/config/production')

# Load routes
#
# The routes file should export a function which is
# called here. `this` in the routes function will be
# `app`.
require('./app/routes').call app

# Run the application
#
# Rather than specify a port here, we use arbitrary
# configurations. Try to keep as much of the app as
# possible configurable through the files in
# ./app/config.
app.listen app.set('port')
console.log 'Server running...'
console.log '  > Listening on port %d in %s mode', app.address().port, app.settings.env
