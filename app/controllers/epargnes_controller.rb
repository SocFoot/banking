class EpargnesController < ApplicationController
  include Authentification, Ad

  before_action :set_epargne, only: [:show, :edit, :update, :destroy]
  before_action only:[:show, :edit, :update] do 
    owner(@epargne, @current_user.id)if !admin_signed_in?
  end
  # GET /epargnes
  # GET /epargnes.json
  def index
    if admin_signed_in?
    @epargnes = Epargne.all
    else
    @epargnes = Epargne.tri(@current_user.id).all
    end
    respond_to do |format|
      format.html
      format.json { render json: @epargnes}
    end
  end

  # GET /epargnes/1
  # GET /epargnes/1.json
  def show
  end

  # GET /epargnes/new
  def new
    @epargne = Epargne.new
    @epargne_types_collect = [[]]
    @user_collect = [[]]
    respond_to do |format|
        format.html
        format.js 
    end
  end

  # GET /epargnes/1/edit
  def edit   
    @epargne_types_collect = EpargneType.where(epargne_id:@epargne.id).collect { |p| [ p.nom ] }
  end

  # POST /epargnes
  # POST /epargnes.json
  def create
    @epargne = Epargne.new(epargne_params)
    @epargne.user_id = @current_user.id  if !admin_signed_in?
    respond_to do |format|
      if @epargne.save
        format.html { redirect_to @epargne, notice: 'Epargne was successfully created.' }
        format.json { render :show, status: :created, location: @epargne }
      else
        format.html { render :new }
        format.json { render json: @epargne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epargnes/1
  # PATCH/PUT /epargnes/1.json
  def update
    @epargne_params = light_epargne_params
    if admin_signed_in?
      @epargne_params = epargne_params
    end
    respond_to do |format|
      if @epargne.update(@epargne_params)
        format.html { redirect_to @epargne, notice: 'Epargne was successfully updated.' }
        format.json { render :show, status: :ok, location: @epargne }
      else
        format.html { render :edit }
        format.json { render json: @epargne.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epargnes/1
  # DELETE /epargnes/1.json
  def destroy
    @epargne.destroy
    respond_to do |format|
      format.html { redirect_to epargnes_url, notice: 'Epargne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epargne
      @epargne = Epargne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def epargne_params
      params.require(:epargne).permit(:libelle, :rate, :receive, :user_id, epargne_types_attributes: [:nom])
    end
    
        
    #without zip and user_id
    def light_epargne_params
      params.require(:epargne).permit(:libelle, :rate, epargne_types_attributes: [:nom])
    end
    
    #if you are not owner you're out!!
    def owner(epargne,id) 
      if !epargne.owner(id) && !admin_signed_in?
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
