class DashController < ApplicationController
  before_filter :login_required, :only => [:admin]
  
  def index
  end
  
  def dynamic
  end

  def dynamic_update
    render(:layout=>false)
  end
  
  def admin
  end
  
  def forcelogin
    self.current_user = User.first
    redirect_to("/admin")
  end
  
  def logout
    logout_keeping_session!
    flash[:notice] = "Logged out!"
    redirect_to("")
  end
  
end