
# Express Coffee Template #

An Express + CoffeeScript + Handlebars + LESS application 
template for Node (aka hipstermatic). This provides a simple 
basis for an application, and helps me skip over the tedious 
part of configuring Express the way I like it.


## Requirements ##

In order to use this template, you'll need the following:

 * Node JS – [Node installation instructions][node]
 * Node Package Manager – [npm installation instructions][npm]
 * CoffeeScript installed globally – 
   run `npm install -g coffee-script`


## Usage ##

It's best not to clone this repo, as you'll end up with all of
the template history in your project. Instead, I recommend that
you [download a compressed copy here][dl].

Once you've extracted the template, you have to install all of
your application's dependencies. From within the top-level
directory of the application, run `npm install -d`.

Now you can run your application with
`coffee server/app.coffee`. Personally, I get annoyed with
having to restart node all the time, so I use [nodemon][nodemon]
you can run it using `cake run` and it will watch for changes
or crashes and restart the server accordingly.

## Further Documentation ##

You can find further documentation on the libraries used in this
template below:

 * CoffeeScript, the beautiful language this template is written 
   in – [docs][coffee]
 * Express, High performance, high class web development for 
   Node.js – [docs][express]


## License ##

Dual licensed under the [MIT][mit] or [GPL Version 2][gpl]
licenses.


[node]: http://nodejs.org/
[npm]: http://npmjs.org/
[dl]: https://github.com/rowanmanning/express-coffee-template/zipball/master
[nodemon]: https://github.com/remy/nodemon
[coffee]: http://jashkenas.github.com/coffee-script/
[express]: http://expressjs.com/
[mit]: http://opensource.org/licenses/mit-license.php
[gpl]: http://opensource.org/licenses/gpl-2.0.php
