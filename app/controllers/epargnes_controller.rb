class EpargnesController < ApplicationController
  include Authentification

  before_action :set_current_user, only: [:create]
  before_action :set_epargne, only: [:show, :edit, :update, :destroy]

  # GET /epargnes
  # GET /epargnes.json
  def index
    @epargnes = Epargne.all
  end

  # GET /epargnes/1
  # GET /epargnes/1.json
  def show
  end

  # GET /epargnes/new
  def new
    @epargne = Epargne.new
    @epargne_types_collect = [[]]
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
    @epargne.user_id = @current_user.id
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
    respond_to do |format|
      if @epargne.update(epargne_params)
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
      params.require(:epargne).permit(:style, :libelle, :rate, :receive, epargne_types_attributes: [:nom])
    end
end
