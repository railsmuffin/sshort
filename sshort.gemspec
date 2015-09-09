# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sshort/version'

Gem::Specification.new do |spec|
  spec.name          = 'sshort'
  spec.version       = Sshort::VERSION
  spec.authors       = ['Railsmuffin LLC.']
  spec.email         = ['sergey@railsmuffin.com']

  spec.summary       = 'Capistrano SSH recipe to initiate an SSH connection to your Capistrano configured server'
  spec.description   = spec.summary
  spec.homepage      = 'http://github.com/railsmuffin/sshort'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.1'
end
