# frozen_string_literal: true

module Devise
  class RevocableSession < ApplicationRecord
    belongs_to :resource, polymorphic: true
    validates_presence_of :resource, :session_id, :device_id
  end
end
