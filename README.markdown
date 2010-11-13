# Slate 
### Wiped and ready to go...

## Huh?
- **Rails 3.0.0**, pre-generated
- Clean basic style to get started, all in [Haml](http://haml-lang.com/) + [Sass](http://sass-lang.com/), with the [960.gs](http://960.gs/) CSS framework for layouts
- YAML config file at `config/config.yml`, and globally accessible via `CONFIG['key_name']`
- [Authlogic](http://github.com/binarylogic/authlogic/tree/master), with a basic authentication system setup
- HAML generators (no more ERB scaffolds!)
- [jQuery](http://jquery.com/) (with the jQuery UJS rails.js file)
- [Stan-JS](http://code.google.com/p/stan-js/) for Internet Explorer pre-9 compatibility
- [Splashy](http://splashyfish.com/icons/) icon set

### Notes
- Tested with 1.9.2head.
- Be sure you edit the Sass templates in `app/styles` rather than the compiled css files in `public/stylesheets`.
- See the `mongo` branch for a Mongoid powered base-app, using Devise instead of Authlogic.

## Get started

1. `git clone git://github.com/ashleyw/Slate.git myapp`
2. `cd myapp`
3. `script/init`
8. `rails server`
    
## About

Tailored to my simplistic needs, hopefully yours too!

By [Ashley Williams](http://ashleyjrw.com). Follow me on Twitter, [@ashleyw](http://twitter.com/ashleyw)!