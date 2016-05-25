class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :destroy]

  def index
    @missions = Mission.all
  end


  def new
    @mission = Mission.new
    authorize @mission
  end


  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    @mission.status = "pending_carrier"
    authorize @mission
    if @mission.save
      redirect_to mission_trips_search_path(@mission)
    else
      render :new
    end
  end

  def show
    authorize @mission
  end

  def destroy
    @mission.destroy
    redirect_to mission_path(@mission)
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:receiver_first_name, :receiver_last_name, :receiver_phone, :starts_on, :timeslot, :departure_city, :arrival_city, :parcel_description,)
  end
end
