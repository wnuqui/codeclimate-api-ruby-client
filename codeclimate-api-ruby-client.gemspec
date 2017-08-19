# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'code_climate/version'

Gem::Specification.new do |spec|
  spec.name          = 'codeclimate-api-ruby-client'
  spec.version       = CodeClimate::VERSION
  spec.authors       = ['Wilfrido Nuqui']
  spec.email         = ['dofreewill22@gmail.com']

  spec.summary       = 'CodeClimate API client.'
  spec.description   = 'CodeClimate API client.'
  spec.homepage      = 'https://github.com/wnuqui/codeclimate-api-ruby-client'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
