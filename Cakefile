#! ./node_modules/.bin/cake run

{spawn, exec} = require 'child_process'

BIN = './node_modules/.bin/'

execAsync = (command, args) ->
    proc = spawn(command, args)   
    proc.stderr.on 'data', (data) -> console.error data.toString()
    proc.stdout.on 'data', (data) -> console.log data.toString()

compile = ->
    compileLess()
    compileCoffee()

compileLess = ->
    console.log('Compiling less...')
    exec(BIN + 'lessc -c client/style/main.less public/style/main.css')        

compileCoffee = ->
    console.log('Compiling client-side coffeescript...')
    exec(BIN + 'browserify -e client/script/bootstrap.coffee -o public/script/main.js')

run = ->
    watch()
    execAsync(BIN + 'nodemon', ['--watch','server/', 'server/app.coffee'])
    
watch = ->
    watchLess()
    watchCoffee()

watchLess = ->
    execAsync(BIN + 'watch-lessc', ['--watch', '-c', '-i', 'client/style/main.less', '-o', 'public/style/main.css'])

watchCoffee = ->
    execAsync(BIN + 'browserify', ['--watch', '-e', 'client/script/bootstrap.coffee', '-o', 'public/script/main.js'])

task('compile', 'Compile less and client-side coffeescript' , compile)
task('compile:less', 'Compile less', compileLess)
task('compile:coffee', 'Compile client-side coffeescript', compileCoffee)
task('run', 'Run application via nodemon and watch for less and coffeescript changes ' , run)
task('watch', 'Watch for less and client-side coffeescript for changes', watch)
task('watch:less', 'Watch for less changes', watchLess)
task('watch:coffee', 'Watch client-side coffeescript changes', watchCoffee)
