module AuthenticatedSystem

  protected

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= user_from_session unless @current_user == false
  end

  def current_user=(new_user)
    session[:user_id] = new_user ? new_user.id : nil
    @current_user = new_user || false
  end

  def user_from_session
    self.current_user = User.find_by_id(session[:user_id]) if session[:user_id]
  end

  # This is ususally what you want; resetting the session willy-nilly wreaks
  # havoc with forgery protection, and is only strictly necessary on login.
  # However, **all session state variables should be unset here**.
  def logout_keeping_session!
    session[:user_id] = nil   # keeps the session but kill our variable
  end

  # The session should only be reset at the tail end of a form POST --
  # otherwise the request forgery protection fails. It's only really necessary
  # when you cross quarantine (logged-out to logged-in).
  def logout_killing_session!
    logout_keeping_session!
    reset_session
  end

end
