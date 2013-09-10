$:.unshift ::File.expand_path('../lib',  __FILE__)

require 'snapa'
run Snapa::File.new(:map)
