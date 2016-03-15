class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_xsrf_token_cookie

   def angular
    @app = true
    render 'layouts/application'
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nom, :prenom, :sexe, :adresse, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nom, :prenom, :sexe, :adresse, :email, :password, :password_confirmation)}
  end
  

  def set_xsrf_token_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    if respond_to?(:valid_authenticity_token?, true)
      super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
    else
      super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
    end
  end
end
