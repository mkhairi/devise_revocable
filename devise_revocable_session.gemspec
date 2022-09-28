# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise_revocable_session/version'

Gem::Specification.new do |spec|
  spec.name          = 'devise_revocable_session'
  spec.license       = 'MIT'
  spec.version       = DeviseRevocableSession::VERSION
  spec.authors       = ['DispatchIt, Inc. Engineers']
  spec.email         = ['engineers@dispatchit.com']

  spec.summary       = 'A module for devise to revoke sessions'
  spec.description   = 'A module for devise to revoke sessions'
  spec.homepage      = 'http://github.com/dispatchitinc/devise_revocable_session'
  spec.metadata      = { 'rubygems_mfa_required' => 'false' }

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_dependency 'activemodel'
  spec.add_dependency 'devise'
end
