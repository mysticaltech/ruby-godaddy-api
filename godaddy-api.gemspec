# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "godaddy-api"
  spec.version       = "0.1.1"
  spec.authors       = ["Nassim Kacha"]
  spec.email         = ["nassim.kacha@gmail.com"]

  spec.summary       = "A very minimalist library to interact with the GoDaddy API."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/nasskach/ruby-godaddy-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
