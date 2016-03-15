class LitigesController < ApplicationController
  include Ad, Authentification
  
  attr_accessor :NUMBER_LIST
  attr_accessor :ALPHABET_LIST


  

  
  # GET /litiges
  # GET /litiges.json
  def index
    if admin_signed_in?
      @litiges = Litige.all
    else
      @litiges = Litige.tri(@current_user).all
    end
  end

  # GET /litiges/1
  # GET /litiges/1.json
  def show
  end

  # GET /litiges/new
  def new
    @litige = Litige.new
    @status = [["Nouveau"], ["en cours de traitement"], ["traité"]]
    @transaction_ids = [[]]
  end

  # GET /litiges/1/edit
  def edit
    @status = [["Nouveau"], ["en cours de traitement"], ["traité"]]
    @transaction_ids = Transaction.all.collect { |p| [ p.id ] }
  end

  # POST /litiges
  # POST /litiges.json
  def create
    @status = [["Nouveau"], ["en cours de traitement"], ["traité"]]
    @litige_params = user_litige_params
    if admin_signed_in?
      @litige_params = litige_params
    end
    @litige_params = {identifiant: Litige.idenfifiant_generator( 2, 3)}.merge(@litige_params)
    @litige = Litige.new(@litige_params)
    respond_to do |format|
      if @litige.save
        format.html { redirect_to @litige, notice: 'Litige was successfully created.' }
        format.json { render :show, status: :created, location: @litige }
      else
        format.html { render :new, locals:{status: @status} }
        format.json { render json: @litige.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /litiges/1
  # PATCH/PUT /litiges/1.json
  def update
    @litige_params = user_litige_params
    if !admin_signed_in?
      @litige_params = litige_params
    end
    respond_to do |format|
      if @litige.update(@litige_params)
        format.html { redirect_to @litige, notice: 'Litige was successfully updated.' }
        format.json { render :show, status: :ok, location: @litige }
      else
        format.html { render :edit }
        format.json { render json: @litige.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /litiges/1
  # DELETE /litiges/1.json
  def destroy
    @litige.destroy
    respond_to do |format|
      format.html { redirect_to litiges_url, notice: 'Litige was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_litige
      @litige = Litige.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def litige_params
      params.require(:litige).permit(:identifiant, :status, :motif, :transaction_id)
    end
    
    def user_litige_params
      params.require(:litige).permit(:motif)
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def conseille_params_user
      params.require(:litige).permit(:transaction_id)
    end
    
    #if you are not owner you're out!!
    def owner(litige,id) 
      if !litige.owner(id) && !admin_signed_in?
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
