class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  # GET /gardens
  # GET /gardens.json
  def index
    @gardens = Garden.all
  end

  # GET /gardens/1
  # GET /gardens/1.json
  def show
    @plant = Plant.new
    @plants = @garden.plants
  end

  # GET /gardens/new
  def new
    @garden = Garden.new
  end

  # GET /gardens/1/edit
  def edit
  end

  # POST /gardens
  # POST /gardens.json
  def create
    @garden = Garden.new(garden_params)
      if @garden.save
        redirect_to @garden
      else
        render :new
      end
  end

  # PATCH/PUT /gardens/1
  # PATCH/PUT /gardens/1.json
  def update
      if @garden.update(garden_params)
        redirect_to @garden
      else
        render :edit
      end
  end

  # DELETE /gardens/1
  # DELETE /gardens/1.json
  def destroy
    @garden.destroy
      redirect_to gardens_url, notice: 'Garden was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden
      @garden = Garden.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garden_params
      params.require(:garden).permit(:name, :banner_url)
    end
end
