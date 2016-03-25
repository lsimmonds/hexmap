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
puts "create @hex: "+@hex.inspect
    end

    respond_to do |format|
      if @hex.save
        #format.html { redirect_to @hex, notice: 'Hex was successfully created.' }
        format.html { render :json => @hex.to_json(:only => [:id, :name, :description, :map_id, :country_id, :province_id, :image, :background, :overlay, :mobile_unit, :x, :y, :local_image]), status: :created }
        #format.json { render :show, status: :created, location: @hex }
        format.json { render :json => @hex.to_json(:only => [:id, :name, :description, :map_id, :country_id, :province_id, :image, :background, :overlay, :mobile_unit, :x, :y, :local_image]), status: :created }
      else
        format.html { render :new }
        format.json { render json: @hex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hexes/1
  # PATCH/PUT /hexes/1.json
  def update
logger.debug "in update, hex: "+@hex.inspect+" hex_params: "+hex_params.inspect
    respond_to do |format|
      if @hex.update(hex_params)
        #format.html { redirect_to @hex, notice: 'Hex was successfully updated.' }
        format.html { render :json => @hex.to_json(:only => [:id, :name, :description, :map_id, :country_id, :province_id, :image, :background, :overlay, :mobile_unit, :x, :y, :local_image]), status: :ok }
        format.json { render :json => @hex.to_json(:only => [:id, :name, :description, :map_id, :country_id, :province_id, :image, :background, :overlay, :mobile_unit, :x, :y, :local_image]), status: :ok }
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
      #@hex = Hex.where(["map_id = ? AND x = ? AND y = ?", params[:map_id],params[:x],params[:y]]).select("id, name, description, map_id, country_id, province_id, image, background, overlay, x, y, local_image")
logger.debug "in set_hex, hex: "+@hex.inspect
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hex_params
logger.debug "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX in hex_params, params: "+params.inspect
      params.require(:hex).permit(:map_id,:x,:y,:name,:image,:country_id,:province_id,:overlay,:mobile_unit)
    end
end
