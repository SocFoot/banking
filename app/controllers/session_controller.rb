class SessionController < ApplicationController
  include Authentification
  def create
      #find user by name then auth them
      @user = User.find_by(nom: params[:nom], prenom: params[:prenom])
      if  @user && @user.authenticate(params[:password])
        set_session(@user)
      else        
        redirect_to :back, notice: "Invalid nom or prenom or password"
      end 
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil 
    redirect_to root_url, notice: "Logged out"
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nom, :prenom, :password)
    end
end
