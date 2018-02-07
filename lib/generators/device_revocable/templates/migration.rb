class DeviseCreateLogins < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :logins do |t|
      t.integer   :user_id,   null: false
      t.string    :session_id, null: false
      t.string    :session_hash
      t.string    :device_id
      t.string    :user_agent
      t.datetime  :signed_in_at
      t.string    :signed_in_ip
      t.datetime  :last_seen_at
      t.string    :last_seen_ip
      t.datetime  :signed_out_at
      t.text      :data
      t.float     :latitude
      t.float     :longitude
      t.boolean   :active, default: true
      t.integer   :parent_id

      t.timestamps
    end

    add_index :logins, :user_id
    add_index :logins, :session_id, unique: true
    add_index :logins, :session_hash
    add_index :logins, :device_id
  end
end
