class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to main_app.root_url, alert: exception.message
    redirect_to new_user_session_path, alert: exception.message
  end
end
