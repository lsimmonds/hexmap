class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:show, :edit, :update, :destroy, :update_properties, :display_properties]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Map.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
#    if @board.name.nil? || @board.length.nil? || @board.width.nil? || @board.countries.empty?
#      render template: "boards/update_properties"
#    else
#      render
#    end
  end

  # GET /boards/new
  def new
    @board = Map.new
    @board.name=""
    @board.length=500
    @board.width=400
    if @board.save
      display_properties
    end
  end

  # GET /boards/1/edit
  def edit
logger.debug "Map: "+@board.inspect
    if @board.name.nil? || @board.length.nil? || @board.width.nil? || @board.countries.empty?
      render template: "boards/update_properties"
    else
      render
    end
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Map.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Map was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params[:board])
logger.debug "board_params[:country]: "+board_params[:country].inspect
        country = board_params[:country]
        unless country.nil? || ( country[:name]=="" && country[:description]=="" && country[:color]=="" &&  country[:color_name]=""  )
          province = board_params[:province]
          if province.nil? || ( province[:name]=="" && province[:description]=="" && province[:color]=="" &&  province[:color_name]=""  )
            @board.countries << Country.new(country)
            @board.save
          else
            country=Country.find country[:id]
            country.provinces << Province.new(province);
          end
        end
        format.html { redirect_to action: "display_properties" }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { redirect_to action: "display_properties", status: :unprocessable_entity}
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /boards/1/display_properties
  def display_properties
    render template: "boards/update_properties"
  end

  # POST /boards/1/update_properties
  def update_properties
logger.debug "board_params[:board]: "+board_params[:board].inspect
logger.debug "board_params: "+board_params.inspect
    respond_to do |format|
      if @board.update(board_params[:board])
        format.html { redirect_to @board, notice: 'Map was successfully updated.' }
        format.json { render status: :ok, location: @board }
      else
        format.html { render }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    render #no destruction for now...
    #@board.destroy
    #respond_to do |format|
      #format.html { redirect_to boards_url, notice: 'Map was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
logger.debug "board_params params:"+params.inspect
logger.debug "board_params params[:board]: "+params[:board].inspect
      if params[:board].nil?
logger.debug "In here......................."
        return ActionController::Parameters.new(board: {:id=>@board[:id],:name=>@board[:name],:length=>@board[:length],:width=>@board[:width]}) 
      end
      params.permit([:board=>[:id,:name,:description,:length,:width],:country=>[:id, :name, :description, :color, :color_name],:province=>[:id, :name, :description, :color, :color_name]])
    end
end
