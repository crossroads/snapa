# Snapa

Use this gem to render your page with phantomjs and take a png snapshot
of the rendered body / css selector, usefull for generating an IE friendly
version of an svg or html5 canvas. A map example is provided by passing :map
to the initializer.

## Installation

Add this line to your application's Gemfile:

    gem 'snapa'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install snapa

## Usage

To run as a stand alone rack app 

    config.ru
    run Snapa::File.new('public/map.html')

To mount under Rails

    config/routes.rb
    mount Snapa::File.new('public/map.html') => '/map.png'

The default cache path is /tmp/snapa or public/system/snapa when mounted
under a rails app. This can be overridden by passing an optional cache_path
param to the initializer.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
