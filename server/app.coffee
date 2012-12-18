
# Dependencies
express = require 'express'

# Create the application server
server = express()

# Server configuration
#
# `baseDir` is used to cache the base directory for
# files in other modules, this avoids having to work
# out where files are in relation to the current one.
#
# Each of the config files should export a function
# which will be used in `server.configure`. `this`
# in these functions will be `server` which makes
# for an intuitive way of writing configurations.
server.set 'baseDir', __dirname + '/..'
server.configure require('./config/default')
server.configure 'development', require('./config/development')
server.configure 'production', require('./config/production')

# Load routes
#
# The routes file should export a function which is
# called here. `this` in the routes function will be
# `server`.
require('./routes').call server

# Run the server
#
# Rather than specify a port here, we use arbitrary
# configurations. Try to keep as much of the server
# as possible configurable through the files in
# ./server/config.
server.listen server.set('port')

console.log 'Server running...'
console.log '  > Listening on port %d in %s mode', server.set('port'), server.settings.env

module.exports = server
