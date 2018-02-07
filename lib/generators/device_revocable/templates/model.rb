class Login < ApplicationRecord
  belongs_to :user
  validates_presence_of :user, :session_id, :device_id
  
  geocoded_by :last_seen_ip
  after_validation :geocode, if: ->(obj){ obj.last_seen_ip.present? and obj.last_seen_ip_changed? }

end
