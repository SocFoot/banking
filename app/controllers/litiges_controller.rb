class LitigesController < ApplicationController
  before_action :set_litige, only: [:show, :edit, :update, :destroy]

  # GET /litiges
  # GET /litiges.json
  def index
    @litiges = Litige.all
  end

  # GET /litiges/1
  # GET /litiges/1.json
  def show
  end

  # GET /litiges/new
  def new
    @litige = Litige.new
    @status = [["Nouveau"], ["en cours de traitement"], ["traité"]]
  end

  # GET /litiges/1/edit
  def edit
    @status = [["Nouveau"], ["en cours de traitement"], ["traité"]]
  end

  # POST /litiges
  # POST /litiges.json
  def create
    @litige = Litige.new(litige_params)

    respond_to do |format|
      if @litige.save
        format.html { redirect_to @litige, notice: 'Litige was successfully created.' }
        format.json { render :show, status: :created, location: @litige }
      else
        format.html { render :new }
        format.json { render json: @litige.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /litiges/1
  # PATCH/PUT /litiges/1.json
  def update
    respond_to do |format|
      if @litige.update(litige_params)
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
end
