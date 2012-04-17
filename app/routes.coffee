
# Routes
module.exports = ->

    # 'Static page' routes
    @get '/', require('./controllers/static').home
