module Admin
  extend ActiveSupport::Concern
 

  included do 
    before_action :admin_only   
  end  
  
  private
  def admin_only
    unless User.first.id == session[:user_id]
      redirect_to root_url, notice: "STOP HERE !!!"
    end
  end

end