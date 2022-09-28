# frozen_string_literal: true

require "devise_revocable_session/version"
require 'devise'
require 'devise_revocable_session/hooks/revocable_session'
require 'devise_revocable_session/models/revocable_session'

module DeviseRevocableSession
  class Engine < ::Rails::Engine
  end
end

Devise.with_options model: true do |d|
	d.add_module :revocable_session
end
