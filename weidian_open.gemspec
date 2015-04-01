# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weidian_open/version'

Gem::Specification.new do |spec|
  spec.name          = "weidian_open"
  spec.version       = WeidianOpen::VERSION
  spec.authors       = ["YanyingWang"]
  spec.email         = ["yanyingwang1@gmail.com"]
  spec.summary       = %q{WeidianOpen}
  spec.description   = %q{Weidian Open Platform(微店开放平台) API in Ruby}
  spec.homepage      = "https://github.com/yanyingwang/weidian_open"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
