class PlantsController < ApplicationController
  before_action :set_plant, only:[:destroy]
  before_action :set_garden, only:[:index,:new,:create]
  def index
    @plants = @garden.plants
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(params_plant)
    @plant.garden = @garden
    if @plant.save
      redirect_to garden_path(@garden), alert: "Plant created!"
    else
      render :new
    end
  end

  def destroy
    @garden = @plant.garden
    @plant.destroy
    redirect_to garden_path(@garden), alert: "Plant Burned down"

  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def params_plant
    params.require(:plant).permit(:name,:image)
  end
end
