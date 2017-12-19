# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "secret/version"

Gem::Specification.new do |spec|
  spec.name          = "secret"
  spec.version       = Secret::VERSION
  spec.authors       = ["TedYin"]
  spec.email         = ["tedworld.time@gmail.com"]

  spec.summary       = %q{Easy Cipher!}
  spec.description   = %q{Make it easy to use Cipher .}
  spec.homepage      = 'https://github,com/TedYin/secret' 
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
