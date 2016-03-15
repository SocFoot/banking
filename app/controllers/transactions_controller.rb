class TransactionsController < ApplicationController
  include Ad, Authentification

  # GET /transactions
  # GET /transactions.json
  def index
    if admin_signed_in?
      @transactions = Transaction.all
    else
      @transactions = Transaction.tri(@current_user.id).all
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
    respond_to do |format|
      @transaction = Transaction.new(transaction_params)
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
    
    #if you are not owner you're out!!
    def owner(transaction,id) 
      if !transaction.owner(id) && !admin_signed_in?
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
