module Ad
  extend ActiveSupport::Concern
 

  included do 
    before_action :admin_only, except:[:hello]   
  end  
  
  private
  def admin_only
    unless admin_signed_in?
      redirect_to root_url, notice: "STOP HERE !!!"
    end
  end

end