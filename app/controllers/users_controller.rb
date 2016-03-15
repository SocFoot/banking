class UsersController < ApplicationController
  include Authentification, Ad
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  # GET /users
  # GET /users.json
  def index
    @user_session = user_session
    @users = User.all    
    respond_to do |format|
      format.html
      format.json { render json: @users}
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
    if user_signed_in?
      @user = @current_user
    end
    @accounts = @user.accounts
    @users = User.all
    @transactions = Transaction.all
    @litiges = Litige.all
    @epargnes = Epargne.all
    @epargne_types = EpargneType.all
    @conseilles = Conseille.all
    @accounts.each.with_index do |account, i|
      instance_variable_set("@last_transactions_"+"#{i}",account.transactions.last(3))
    end
    
  end

  # GET /users/new
def new
    if (user_signed_in? )
      redirect_to new_user_session_url, notice:"connect toi mec!"
    end
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if !admin_signed_in?
      @user = @current_user
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|   
      if session[:user_id] && !admin?
        format.html {redirect_to root_path, notice:"T'as déjà un compte mec!"}
      elsif @user.save
        format.html { render redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def hello
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nom, :prenom, :sexe, :adresse, :password, :password_confirmation)
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

end
