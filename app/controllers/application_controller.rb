class ApplicationController < ActionController::Base
  def after_sign_up_path_for(resource)
    root_path # Redirect to the root path or anywhere else after sign-up
  end

  def after_sign_in_path_for(resource)
    root_path # Redirect to the root path or a dashboard after sign-in
  end
end
