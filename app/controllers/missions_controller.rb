class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  def index
    @missions = policy_scope(Mission)

  end


  def new
    @mission = Mission.new
    authorize @mission
  end


  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    authorize @mission
    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  def show
    @mission = Mission.find(params[:id])
    authorize @mission
  end

  def edit
  end

  def update
    @mission.update(mission_params)
    if @mission.save
      redirect_to missions_path
    else
      render :edit
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to mission_path(@mission)
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
    authorize @mission
  end

  def mission_params
    params.require(:mission).permit(:receiver_first_name, :receiver_last_name, :receiver_phone, :starts_on, :timeslot, :departure_city, :arrival_city, :parcel_description,)
  end
end
