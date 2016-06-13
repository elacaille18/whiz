class MissionsController < ApplicationController

  before_action :set_mission, only: [:show, :edit, :update, :destroy, :check_start_code, :check_end_code, :payment]


  def index
    @missions = policy_scope(Mission).order(created_at: :desc)

  end


  def new
    @mission = Mission.new
    authorize @mission
  end


  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    @mission.status = "pending_carrier"
    @mission.start_code = rand(100000..999999)
    @mission.end_code = "457613"
    @mission.price = 12
    generate_twitter_message(@mission)
    authorize @mission
    if @mission.save
      current_user.update(phone: params[:sender_phone]) if params[:sender_phone]
      redirect_to mission_trips_search_path(@mission)
    else
      render :new
    end
  end

  def show
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
    @mission.destroy
    redirect_to mission_path(@mission)
  end
  #---------------------------------------
  #Payement zone

  def payment
    @mission.status = "ready"
    @mission.save
    authorize @mission
    redirect_to mission_path(@mission)
  end

  #---------------------------------------
  # Dynamique de vérification des codes
  def check_start_code
    start_code_attempt = params[:start_code]

    if @mission.start_code == start_code_attempt
      @mission.status = "on-going"
      @mission.save
    end

    respond_to do |format|
        format.html { redirect_to mission_path(@mission) }
        format.js
      end
  end

  def check_end_code
    end_code_attempt = params[:end_code]

    if @mission.end_code == end_code_attempt
      @mission.status = "delivered"
      @mission.save
    end

    respond_to do |format|
        format.html { redirect_to mission_path(@mission) }
        format.js
      end
  end

  #-----------------------------------------------------------#
  private

  def set_mission
    @mission = Mission.find(params[:id])
    authorize @mission
  end

  def mission_params
    params.require(:mission).permit(:receiver_first_name, :receiver_last_name, :receiver_phone, :starts_on, :timeslot, :departure_city, :arrival_city, :parcel_description, :photo, :photo_cache)
  end

  def generate_twitter_message(mission)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
      end

    date = mission.starts_on.to_s
    date =" #{date[8..9]}/#{date[5..6]} "

    client.update("Tu vas de #{mission.departure_city[0..-9]} à #{mission.arrival_city[0..-9]} le #{date}? On te donne 10€ ! check it out : www.whiz.fr/transporteur ")

  end
end
