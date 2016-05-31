class OrdersController < ApplicationController
  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  def create
    @mission = Mission.find(params[:mission_id])
    authorize @mission
    order = Order.create!(sku: "#{@mission.departure_city}, #{@mission.arrival_city}, #{@mission.created_at}" )

    @mission.status = "ready"
    @mission.save
    redirect_to mission_path(@mission)
  end
end
