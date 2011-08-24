## Depends on authorized system methods like current_user and logged_in?
module AuthorizedSystem

  protected
  
  def access_denied
    if logged_in?
      flash[:error] = "You don't have permission to perform that action."
    else
      flash[:error] = "Ya gotz ta login first!"
    end
    redirect_to("/")
  end

  def login_required
    logged_in? ? true : access_denied
  end

  def admin_access_required
    current_user.admin? || access_denied
  end

end
