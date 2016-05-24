class TripsController < ApplicationController

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private


end
