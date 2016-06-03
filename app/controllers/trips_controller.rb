class TripsController < ApplicationController
  before_action :set_trip ,only: [:show, :edit, :update, :destroy, :choose]
  skip_after_action :verify_authorized, only: :update_mission_with_trip

  def index
    @trips = policy_scope(Trip).order(created_at: :desc)
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user

    authorize @trip
    if @trip.save
      current_user.update(phone: params[:carrier_phone]) if params[:carrier_phone]
      redirect_to trips_path
    else
      render :new
    end
  end

  # Ces actions sont nestées dans une mission
  def search
    @mission = Mission.find(params[:mission_id])
    # @trips = Trip.all
    # faire une methode privee pour la recherche
    @trips_results = search_filter_trips(@mission)
    authorize @mission
  end

  def update_mission_with_trip
    @mission = Mission.find(params[:mission_id])
    @trip = Trip.find(params[:trip_id])
    @mission.trip = @trip
    @trip.status = "to-be-confirmed"
    @trip.save
    @mission.save
    redirect_to mission_path(@mission)
  end
###########################################

  def trip_accept_mission
    @trip =Trip.find(params[:trip_id])
    @mission = Mission.where(trip_id: @trip.id).first
    @trip.status = "chosen"
    @mission.status = "pending_payment"
    @trip.save
    @mission.save
    authorize @trip
    redirect_to trips_path
  end

  def edit

  end

  def update
    @trip.update(trip_params)
    if @trip.save
      redirect_to trips_path
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    authorize @trip
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:starts_at, :ends_at, :departure_city, :arrival_city, :departure_longitude, :departure_latitude, :arrival_longitude, :arrival_latitude)

  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def search_filter_trips(mission)
    trips = Trip.where("date(starts_at) = ? AND departure_city = ? AND arrival_city = ?", mission.starts_on, mission.departure_city, mission.arrival_city)
    #trips = Trip.where("departure_city = ? AND arrival_city = ?", mission.departure_city, mission.arrival_city)
  end

end

