#! ./node_modules/.bin/cake compile

{exec} = require 'child_process'

BIN = './node_modules/.bin/'

compile = ->
    less()
    coffee()

less = ->
    console.log('Compiling less...')
    exec(BIN + 'lessc --yui-compress client/style/main.less public/style/main.css')        
    console.log('Done.')

coffee = ->
    console.log('Compiling client-side coffeescript...')
    exec(BIN + 'browserify -e client/script/bootstrap.coffee -o public/script/main.js')
    console.log('Done.');

task('compile', 'Compile less and client-side coffeescript' , compile)
task('compile:less', 'Compile less', less)
task('compile:coffee', 'Compile client-side coffeescript', coffee)


# watch

# run (with watch)