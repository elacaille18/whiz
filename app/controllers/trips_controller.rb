class TripsController < ApplicationController

  before_action :set_trip ,only: [:show, :edit, :update, :destroy]

  def index
    @trips = policy_scope(Trip)
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user

    authorize @trip
    if @trip.save!
      redirect_to trips_path
    else
      render :new
    end
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

    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:starts_at, :ends_at, :departure_city, :arrival_city)

  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end


end

