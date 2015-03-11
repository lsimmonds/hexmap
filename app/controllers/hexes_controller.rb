class HexesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_hex, only: [:show, :edit, :create, :update, :destroy]

  # GET /hexes
  # GET /hexes.json
  def index
    @hexes = Hex.all
  end

  # GET /hexes/1/2/3
  # GET /hexes/1/2/3.json
  def show
#    if (@hex)
#      @hex.local_image = ActionController::Base.helpers.asset_path(@hex.image)
#    end
logger.debug "in show, hex: "+@hex.inspect
    render :json => @hex
  end

  # GET /hexes/1
  # GET /hexes/1.json
  def show_map
    @hexes = Hex.where(:map_id => params[:map_id])
    render :json => @hexes
  end

  # GET /hexes/new
  def new
    @hex = Hex.new
  end

  # GET /hexes/1/edit
  def edit
  end

  # POST /hexes
  # POST /hexes.json
  def create
    if @hex
      update
      return
    else
      @hex = Hex.new(hex_params)
    end

    respond_to do |format|
      if @hex.save
        #format.html { redirect_to @hex, notice: 'Hex was successfully created.' }
        format.html { render :json => @hex, status: :created }
        #format.json { render :show, status: :created, location: @hex }
        format.json { render :json => @hex, status: :created }
      else
        format.html { render :new }
        format.json { render json: @hex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hexes/1
  # PATCH/PUT /hexes/1.json
  def update
logger.debug "in update, hex: "+@hex.inspect
    respond_to do |format|
      if @hex.update(hex_params)
        #format.html { redirect_to @hex, notice: 'Hex was successfully updated.' }
        format.html { render :json => @hex, status: :ok }
        format.json { render :json => @hex, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @hex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hexes/1
  # DELETE /hexes/1.json
  def destroy
    @hex.destroy
    respond_to do |format|
      format.html { redirect_to hexes_url, notice: 'Hex was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hex
      @hex = Hex.find_by_map_id_and_x_and_y(params[:map_id],params[:x],params[:y])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hex_params
      params.require(:hex).permit(:map_id,:x,:y,:name,:image,:country_id,:province_id)
    end
end
