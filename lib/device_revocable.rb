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


if defined?(ActiveRecord)
  #class Login < ActiveRecord::Base
    #belongs_to :user
    #validates_presence_of :user, :session_id, :device_id
    
    #geocoded_by :last_seen_ip
    #after_validation :geocode, if: ->(obj){ obj.last_seen_ip.present? and obj.last_seen_ip_changed? }

  #end
end