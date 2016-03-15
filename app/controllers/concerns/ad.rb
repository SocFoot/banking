module Ad
  extend ActiveSupport::Concern

  included do |target|
    before_action :admin_only, except:[:hello]
    target.extend Authority
    target.set_account_controller
    target.set_transaction_controller
    target.set_litige_controller
    target.set_conseille_controller
    target.set_user_controller
  end  

  module Authority  
    def set_account_controller
      if (self.name == "AccountsController" || self.name == "EpargnesController")
        skip_before_action :admin_only, except: [:destroy]
        before_action :set_current_user, only: [:index, :create, :edit, :update, :new]
        before_action :logged?, only: [:index, :create, :edit, :update, :show, :new]

      end
    end

    def set_transaction_controller
      if self.name == "TransactionsController"
        skip_before_action :admin_only, only:[:index, :show]
        before_action :logged?
        before_action :set_transaction, only: [:show, :edit, :update, :destroy]
        before_action only:[:show, :edit, :update] do 
          owner(@transaction, @current_user.id) if !admin_signed_in?
        end
      end
    end
    
    def set_litige_controller
      if self.name == "LitigesController"
        skip_before_action :admin_only, except:[:destroy]
        before_action :logged?
        before_action :set_litige, only: [:show, :edit, :update, :destroy]
        before_action only:[:show, :edit, :update] do
          owner(@litige, @current_user.id) if  user_signed_in?
        end
      end   
    end
    
    def set_conseille_controller
      if self.name == "ConseillesController"
        skip_before_action :admin_only, except:[:new, :create, :show, :edit, :update]
        before_action :logged?
      end   
    end
    
    def set_user_controller
      if self.name == "UsersController"
        before_action :admin_only, only: [:destroy]
        before_action :logged?, except: [:new, :create, :hello]
      end
    end
  end
  
  private
  def admin_only
    unless admin_signed_in?
      redirect_to root_url, notice: "STOP HERE !!!"
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    #if you are not owner you're out!!
    def owner(account,id) 
      if !account.owner(id) && !admin_signed_in?
        redirect_to root_url, notice: "bad owner!"
      end
    end
    
    #if you're not logged you're out!!
    def logged?
      if !(user_signed_in? || admin_signed_in?)
        redirect_to new_user_session_url, notice:"connect toi mec!"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_epargne
      @epargne = Epargne.find(params[:id])
    end
    
     # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_conseille
      @conseille = Conseille.find(params[:id])
    end
end