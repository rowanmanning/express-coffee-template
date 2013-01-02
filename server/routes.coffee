
# Routes
module.exports = ->

    # 'Static page' routes
    @get '/', require('./controller/home').home
