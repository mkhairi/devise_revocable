# frozen_string_literal: true

class CreateRevocableSessions < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :revocable_sessions do |t|
      t.integer   :resource_id,   null: false
      t.string    :resource_type,   null: false
      t.string    :session_id, null: false
      t.string    :device_id
      t.string    :user_agent
      t.datetime  :signed_in_at
      t.string    :signed_in_ip
      t.datetime  :last_seen_at
      t.string    :last_seen_ip
      t.datetime  :signed_out_at
      t.boolean   :active, default: true

      t.index [:resource_id, :resource_type], name: :resource
      t.index :session_id, unique: true
      t.index :device_id

      t.timestamps
    end
  end
end
