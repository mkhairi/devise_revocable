require "device_revocable/version"

module DeviceRevocable
  # Your code goes here...
end

require 'devise'
require 'devise_revocable/hooks/revocable'
require 'devise_revocable/models/revocable'

Devise.with_options model: true do |d|
	d.add_module :revocable
end