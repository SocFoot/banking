class TransactionsController < ApplicationController
  include Admin, Authentification
  before_action :logged?, only: [:index]
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    if admin?
      @transactions = Transaction.all
    else
      @transaction = Transaction.tri(@current_user.id).all
    end
    respond_to do |format|
      format.html
      format.json { render json: @transactions}
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @account_ids = [[]]
  end

  # GET /transactions/1/edit
  def edit
    @account_ids = Account.all.collect { |p| [ p.id ] }
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @account = Account.find_by(zip_params)
    
    respond_to do |format|

      @transaction = Transaction.new(transaction_params)
      @transaction.account_id = @account.id
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
 
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:in, :out, :libelle)
    end
    
    # NSA IS BAD FOR YOUR PARAMETERS
    def zip_params
      params.require(:transaction).permit(:zip)
    end
    
      def logged?
    if session[:user_id].nil?
      redirect_to root_url, notice:"connect toi mec!"
    end
  end
end
