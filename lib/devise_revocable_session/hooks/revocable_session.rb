# frozen_string_literal: true

# After authenticating, we’re removing any session activation that may already
# exist, and creating a new session# activation. We generate our own random id
# (in User#activate_session) and store it in the auth_id key. There is already
# a session_id key, but the session gets renewed (and the session id changes)
# after authentication in order to avoid session fixation attacks. So it’s
# easier to just use our own id.
Warden::Manager.after_set_user except: :fetch do |record, warden, options|
  scope = options[:scope]
  if record && record.respond_to?(:has_revocable_sessions?) && record.has_revocable_sessions?
    record.deactivate_session!(warden.raw_session[:auth_id])
    revocable_session = record.activate_session(warden.request)
    warden.raw_session[:auth_id] = revocable_session.session_id
    warden.cookies[:device_id] = revocable_session.device_id
  end
end

# After fetching a user from the session, we check that the session is marked
# as active for that record. If it’s not we log the user out.
Warden::Manager.after_fetch do |record, warden, options|
  scope = options[:scope]
  if record && record.respond_to?(:has_revocable_sessions?) && record.has_revocable_sessions?
    device_cookie = warden.cookies[:device_id]
    valid_session = record.session_active?(device_cookie, warden.raw_session[:auth_id])
    if device_cookie.present? and valid_session
      record.mark_last_seen!(device_cookie)
    else
      warden.logout(scope)
      throw :warden, scope: scope, message: :unauthenticated
    end
  end
end

# When logging out, we deactivate_session! the current session. This ensures that the
# session cookie can’t be reused afterwards.
Warden::Manager.before_logout do |record, warden, options|
  scope = options[:scope]
  if record && record.respond_to?(:has_revocable_sessions?) && record.has_revocable_sessions?
    record.deactivate_session!(warden.raw_session[:auth_id])
    warden.cookies.delete(:device_id)
  end
end
