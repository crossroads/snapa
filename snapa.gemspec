# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snapa/version'

Gem::Specification.new do |spec|
  spec.name          = "snapa"
  spec.version       = Snapa::VERSION
  spec.authors       = ["Ben Tillman"]
  spec.email         = ["ben.tillman@gmail.com"]
  spec.description   = %q{Uses phantomjs to render and take a png snapshot of part of a page}
  spec.summary       = %q{Use this gem to render your page with phantomjs and take a png snapshot
of the rendered body / css selector, usefull for generating an IE friendly
version of an svg or html5 canvas. A map example is provided by passing :map
to the initializer.}
  spec.homepage      = "https://github.com/crossroads/snapa"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
