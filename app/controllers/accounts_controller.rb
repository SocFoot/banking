class AccountsController < ApplicationController
  include Authentification, Ad

  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action only:[:update] do 
    owner(@account, @current_user.id)if !admin_signed_in?
  end
  # GET /accounts
  # GET /accounts.json
  def index
    index = json_account_params[:json_id].to_i if !index 
    if admin_signed_in?
      @accounts = Account.all
    else
      @accounts = Account.tri(@current_user.id).all[(index)..(index + 5)]
    end
    index = index + 1
    respond_to do |format|
      format.html
      format.json { render json: @accounts, locals: {last: "@last"} }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    owner(@account, @current_user.id) if !admin_signed_in?
  end

  # GET /accounts/new
  def new
    @account = Account.new
    respond_to do |format|
        format.html
        format.js 
    end
  end

  # GET /accounts/1/edit
  def edit
    owner(@account, @current_user.id) if !admin_signed_in?
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account.zip = Account.random_zip
    @account.user_id = @current_user.id if @current_user
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update      
    @account_params = light_account_params
    if admin_signed_in?
      @account_params = account_params
    end
    respond_to do |format|
      if @account.update(@account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    #(ADMIN ONLY) Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:libelle, :user_id, :conseille_id)
    end
    #(ADMIN ONLY) Never trust parameters from the scary internet, only allow the white list through.
    def json_account_params
      params.permit(:json_id, :data_id)
    end
    
    #without zip and user_id
    def light_account_params
      params.require(:account).permit(:libelle)
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
