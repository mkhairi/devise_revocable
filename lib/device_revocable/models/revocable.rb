module Devise
  module Models
    module Revocable
      extend ActiveSupport::Concern

        included do
          has_many :logins, dependent: :destroy
        end

         #session
        def activate_session(request)
          new_session = logins.new(attrs_for_login(request))
          new_session.session_id = SecureRandom.hex(64)
          new_session.device_id  = SecureRandom.uuid
          new_session.signed_in_ip = request.remote_ip
          new_session.save
          purge_old_sessions
          new_session
        end

        def exclusive_session(session_id)
          logins.where('session_id != ?', session_id).delete_all
        end

        def session_active?(device_id, session_id)
          logins.where(device_id: device_id, session_id: session_id).exists?
        end

        def deactivate_session!(session_id)
          logins.where(session_id: session_id).delete_all
        end

        def purge_old_sessions
          logins.order('created_at desc').offset(10).destroy_all
        end

        def mark_last_seen!(device_id)
          login_record = logins.find_by(device_id: device_id)
          #skip second to reduce database hit
          if (Time.now - (login_record.last_seen_at)) >= 60
            login_record.update_column :last_seen_at, Time.now
          end
        end

        protected

        def attrs_for_login(request)
          t = Time.now
          { user_agent: request.user_agent,
            last_seen_ip: request.remote_ip,
            signed_in_at: t,
            last_seen_at: t }
        end

    end
  end
end