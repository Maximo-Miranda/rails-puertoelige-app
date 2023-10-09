class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  # def after_sign_in_path_for(resource)
  #   if current_user.admin?
  #     admin_root_path
  #   else
  #     root_path
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name lastname identification email password password_confirmation])
  end

  # Determine where to redirect user after successful login.
  # https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-in
  def after_sign_up_path_for(resource)
    url = session[:fall_back_url]
    session[:fall_back_url] = nil
    if current_user && url
      url
    end
  end

end
