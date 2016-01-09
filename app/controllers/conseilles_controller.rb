class ConseillesController < ApplicationController
  before_action :admin_only
  before_action :set_conseille, only: [:show, :edit, :update, :destroy]

  # GET /conseilles
  # GET /conseilles.json
  def index
    @conseilles = Conseille.all
  end

  # GET /conseilles/1
  # GET /conseilles/1.json
  def show
  end

  # GET /conseilles/new
  def new
    @conseille = Conseille.new
    @user_ids = User.all.collect { |p| [ p.id ] }  
    @account_ids = Account.all.collect { |p| [ p.id ] }
    @transaction_ids = Transaction.all.collect { |p| [ p.id ] }
    @litige_ids = Litige.all.collect { |p| [ p.id ] }
  end

  # GET /conseilles/1/edit
  def edit
    @user_ids = User.all.collect { |p| [ p.id ] }  
    @account_ids = Account.all.collect { |p| [ p.id ] }
    @transaction_ids = Transaction.all.collect { |p| [ p.id ] }
    @litige_ids = Litige.all.collect { |p| [ p.id ] }
  end

  # POST /conseilles
  # POST /conseilles.json
  def create
    @conseille = Conseille.new(conseille_params)
    respond_to do |format|
      if @conseille.save
        format.html { redirect_to @conseille, notice: 'Conseille was successfully created.' }
        format.json { render :show, status: :created, location: @conseille }
      else
        format.html { render :new }
        format.json { render json: @conseille.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conseilles/1
  # PATCH/PUT /conseilles/1.json
  def update
    respond_to do |format|
      if @conseille.update(conseille_params)
        format.html { redirect_to @conseille, notice: 'Conseille was successfully updated.' }
        format.json { render :show, status: :ok, location: @conseille }
      else
        format.html { render :edit }
        format.json { render json: @conseille.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conseilles/1
  # DELETE /conseilles/1.json
  def destroy
    @conseille.destroy
    respond_to do |format|
      format.html { redirect_to conseilles_url, notice: 'Conseille was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conseille
      @conseille = Conseille.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conseille_params
      params.require(:conseille).permit(:nom, :prenom, :user_id, :account_id, :transaction_id, :litige_id)
    end
    
        # ONLY ME I AND MYSELF!!!!
    def admin_only
      unless User.first.id == session[:user_id]
        redirect_to root_url, notice: "STOP HERE !!!"
      end
    end
end
