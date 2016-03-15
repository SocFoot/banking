module Authentification
  extend ActiveSupport::Concern
  
      

  
  private

  
    def set_current_user
      @current_user = User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      @current_user = nil    
    end
end