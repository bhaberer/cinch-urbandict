# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cinch/plugins/urbandict/version'

Gem::Specification.new do |gem|
  gem.name          = "cinch-urbandict"
  gem.version       = Cinch::Plugins::UrbanDict::VERSION
  gem.authors       = ["Brian Haberer"]
  gem.email         = ["bhaberer@gmail.com"]
  gem.description   = %q{Cinch Plugin to fetch definition data from Urban Dictionary}
  gem.summary       = %q{Cinch Plugin for Urban Dictionary}
  gem.homepage      = "https://github.com/bhaberer/cinch-urbandict"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('cinch-toolbox', '>= 0.0.3')
  gem.add_dependency('cinch-cooldown')
end
