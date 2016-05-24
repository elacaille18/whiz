class MissionsController < ApplicationController
  before_action :set_mission, only: [:destroy]

  def index
    @missions = Mission.all
  end


  def new
    @mission = Mission.new
  end


  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to mission_path(@mission)
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:receiver_first_name, :receiver_last_name, :receiver_phone, :departure_city, :arrival_city, :parcel_description,)
  end
end
