$:.unshift ::File.expand_path('../lib',  __FILE__)

use Rack::Static,
  :urls => ['/countries.json', '/d3.v3.min.js', '/favicon.ico', '/map.html', '/topojson.v1.min.js'],
  :root => 'public'

require 'snapa'
run Snapa::File.new('public/map.html')
