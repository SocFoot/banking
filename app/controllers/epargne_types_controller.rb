class EpargneTypesController < ApplicationController
  before_action :admin_only
  before_action :set_epargne_type, only: [:show, :edit, :update, :destroy]

  # GET /epargne_types
  # GET /epargne_types.json
  def index
    @epargne_types = EpargneType.all
  end

  # GET /epargne_types/1
  # GET /epargne_types/1.json
  def show
  end

  # GET /epargne_types/new
  def new
    @epargne_type = EpargneType.new
    @epargne_collect = Epargne.all.collect { |p| [ p.id ] }
  end

  # GET /epargne_types/1/edit
  def edit
  end

  # POST /epargne_types
  # POST /epargne_types.json
  def create
    @epargne_type = EpargneType.new(epargne_type_params)

    respond_to do |format|
      if @epargne_type.save
        format.html { redirect_to @epargne_type, notice: 'Epargne type was successfully created.' }
        format.json { render :show, status: :created, location: @epargne_type }
      else
        format.html { render :new }
        format.json { render json: @epargne_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epargne_types/1
  # PATCH/PUT /epargne_types/1.json
  def update
    respond_to do |format|
      if @epargne_type.update(epargne_type_params)
        format.html { redirect_to @epargne_type, notice: 'Epargne type was successfully updated.' }
        format.json { render :show, status: :ok, location: @epargne_type }
      else
        format.html { render :edit }
        format.json { render json: @epargne_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epargne_types/1
  # DELETE /epargne_types/1.json
  def destroy
    @epargne_type.destroy
    respond_to do |format|
      format.html { redirect_to epargne_types_url, notice: 'Epargne type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epargne_type
      @epargne_type = EpargneType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def epargne_type_params
      params.require(:epargne_type).permit(:nom, :epargne_id)
    end
    
    #ONLY ME ME ME
    def admin_only
        unless User.first.id == session[:user_id]
          redirect_to root_url, notice: "STOP HERE !!!"
      end
    end
end
