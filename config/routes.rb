Derailed::Application.routes.draw do
  
  match "/" => "dash#index"
  match "/dynamic" => "dash#dynamic"
  match "/dynamic_update" => "dash#dynamic_update"
  match "/admin" => "dash#admin"
  match "/login" => "dash#forcelogin"
  match "/logout" => "dash#logout"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
