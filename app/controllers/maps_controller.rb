class MapsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_map, only: [:show, :edit, :play, :update, :destroy, :update_properties, :display_properties]

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
    if @map.name.nil? || @map.length.nil? || @map.width.nil? || @map.countries.empty?
      render template: "maps/update_properties"
    else
      render
    end
  end

  # GET /maps/new
  def new
    @map = Map.new
    @map.name=""
    @map.length=500
    @map.width=400
    if @map.save
      display_properties
    end
  end

  # GET /maps/1/edit
  def edit
logger.debug "Map: "+@map.inspect
    if @map.name.nil? || @map.length.nil? || @map.width.nil? || @map.countries.empty?
      render template: "maps/update_properties"
    else
      render
    end
  end

  # GET /maps/1/play
  def play
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render :show, status: :created, location: @map }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params[:map])
logger.debug "map_params[:country]: "+map_params[:country].inspect
        country = map_params[:country]
        unless country.nil? || ( country[:name]=="" && country[:description]=="" && country[:color]=="" &&  country[:color_name]=""  )
          province = map_params[:province]
          if province.nil? || ( province[:name]=="" && province[:description]=="" && province[:color]=="" &&  province[:color_name]=""  )
            @map.countries << Country.new(country)
            @map.save
          else
            country=Country.find country[:id]
            country.provinces << Province.new(province);
          end
        end
        format.html { redirect_to action: "display_properties" }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { redirect_to action: "display_properties", status: :unprocessable_entity}
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /maps/1/display_properties
  def display_properties
    render template: "maps/update_properties"
  end

  # POST /maps/1/update_properties
  def update_properties
logger.debug "map_params[:map]: "+map_params[:map].inspect
logger.debug "map_params: "+map_params.inspect
    respond_to do |format|
      if @map.update(map_params[:map])
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { render status: :ok, location: @map }
      else
        format.html { render }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    render #no destruction for now...
    #@map.destroy
    #respond_to do |format|
      #format.html { redirect_to maps_url, notice: 'Map was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
logger.debug "map_params params:"+params.inspect
logger.debug "map_params params[:map]: "+params[:map].inspect
      if params[:map].nil?
logger.debug "In here......................."
        return ActionController::Parameters.new(map: {:id=>@map[:id],:name=>@map[:name],:length=>@map[:length],:width=>@map[:width]}) 
      end
      params.permit([:map=>[:id,:name,:description,:length,:width],:country=>[:id, :name, :description, :color, :color_name],:province=>[:id, :name, :description, :color, :color_name]])
    end
end
