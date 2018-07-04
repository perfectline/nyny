# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nyny/version'

Gem::Specification.new do |spec|
  spec.name          = "nyny"
  spec.version       = NYNY::VERSION
  spec.authors       = ["Andrei Lisnic"]
  spec.email         = ["andrei.lisnic@gmail.com"]
  spec.description   = %q{New York, New York - a (ridiculously) small and powerful web framework.}
  spec.summary       = %q{New York, New York.}
  spec.homepage      = "http://alisnic.github.io/nyny/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/).select {|f| !f.start_with?('examples')}
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency             "rack-contrib"
  spec.add_dependency             "tilt"
  spec.add_dependency             "actionpack"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
