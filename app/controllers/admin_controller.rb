class AdminController < ApplicationController
  include Authentification, Ad
  before_action :set_current_user, only: [:show]
  
  def show
    @users = User.all
    @accounts = Account.all
    @transactions = Transaction.all

    @litiges = Litige.all

    @epargnes = Epargne.all

    @epargne_types = EpargneType.all
    
    @conseilles = Conseille.all
  end

end
