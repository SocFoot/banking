module Authentification
  extend ActiveSupport::Concern
  
      
  included do
    before_action :set_current_user
    before_action :admin?
  end
  
  private
    def admin?
      if @current_user
        @admin = ( @current_user.id == User.first.id)
      end
    end
  
    def set_current_user
      @current_user = User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      @current_user = nil    
    end
    
    def set_session(user)
      session[:user_id] = @user.id
      @current_user = User.find(session[:user_id])
      redirect_to user_path(@user)
    rescue ActiveRecord::RecordNotFound
      redirect_to root, alert: "login problem"
    end
end