
# Home controller
#
# Serves the application home page
module.exports = (request, response) ->
    
  response.render 'home',
    title: 'Welcome!'
    thing: 'World'
