$:.push File.expand_path("../lib", __FILE__)
require "devise_revocable_session/version"

Gem::Specification.new do |spec|
  spec.name          = "devise_revocable_session"
  spec.version       = DeviseRevocableSession::VERSION
  spec.authors       = ['Carl Allen']
  spec.email         = ["github@allenofmn.com"]

  spec.summary       = 'A module for devise to revoke sessions'
  spec.description   = 'A module for devise to revoke sessions'
  spec.homepage      = 'http://github.com/carlallen/devise_revocable_session'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "devise"
  spec.add_dependency "activemodel"
end
