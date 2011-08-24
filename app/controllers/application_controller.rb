class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthenticatedSystem
  include AuthorizedSystem
  
  helper_method :current_user, :admin_access_required

end
