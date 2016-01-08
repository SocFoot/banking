class AdminController < ApplicationController
  include Authentification
  before_action :admin_only
  before_action :set_current_user, only: [:show]
  
  def show
    @user = User.new
    @users = User.all
    @account = Account.new
    @accounts = Account.all
    @transaction = Transaction.new
    @transactions = Transaction.all
    @status = [["Nouveau"], ["en cours de traitement"], ["traité"]]
    
    @litige = Litige.new
    @litiges = Litige.all
    
    @epargne = Epargne.new
    @epargnes = Epargne.all
    @epargne_types_collect = [[]]
      
    @epargne_type = Epargne.new
    @epargne_types = EpargneType.all
    @epargne_collect = Epargne.all.collect { |p| [ p.id ] }
  end
  
  private
      def admin_only
        unless User.first.id == session[:user_id]
          redirect_to root_url, notice: "STOP HERE !!!"
        end
      end
end
