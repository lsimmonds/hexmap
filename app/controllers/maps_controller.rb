class MapsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
  end

  # GET /maps/new
  def new
    @map = Map.new
    @map.name=""
    @map.length=500
    @map.width=400
    if @map.save
      show
    end
  end

  # GET /maps/1/edit
  def edit
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)
    @map.creator=current_user
    @map.updater=current_user

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
      if @map.save(map_params[:map])
        country = map_params[:country]
        unless country.nil? || ( country[:name]=="" && country[:description]=="" && country[:color]=="" &&  country[:color_name]=""  )
          province = map_params[:province]
          if province.nil? || ( province[:name]=="" && province[:description]=="" && province[:color]=="" &&  province[:color_name]=""  )
            @map.countries.create(country)
          else
            country=Country.find country[:id]
            country.provinces.create(province);
          end
        end
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :show, status: :unprocessable_entity, location: @map }
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
      @map.updater=current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.permit([:map=>[:id,:name,:description,:length,:width],:country=>[:id, :name, :description, :color, :color_name],:province=>[:id, :name, :description, :color, :color_name]])
    end
end
