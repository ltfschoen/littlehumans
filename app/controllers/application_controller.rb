class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  # end

  def after_sign_in_path_for(resource)
    # use /user 
    sign_in_url = url_for(:action => 'index', :controller => '/users', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url
      super
    else
      # redirects to the users show page when logged in
      dashboard_url
      #user_url(current_user.id)
    end
  end

  protected

    def configure_permitted_parameters
      custom_fields = %i(twitter_login provider uid kind image name)
      devise_parameter_sanitizer.for(:sign_up) << custom_fields
      devise_parameter_sanitizer.for(:account_update) << custom_fields
    end

end