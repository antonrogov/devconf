# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devconf/version'

Gem::Specification.new do |gem|
  gem.name          = "devconf"
  gem.version       = Devconf::VERSION
  gem.authors       = ["Anton Rogov"]
  gem.email         = ["antonrogov@me.com"]
  gem.description   = %q{Simple development flow helper that disables development.log, adds STDOUT logging instead, loads .env}
  gem.summary       = %q{Development config}
  gem.homepage      = "http://github.com/antonr/devconf"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
