
# 'Static' page controller
module.exports =

    # Index action
    #
    # Serves the application home page
    index: (request, response) ->
        response.render 'index',
            title: 'Home'
            thing: 'World'
