class PagesController < ApplicationController

  # Allow visitor to see the home page and the home page for transporteur
  skip_before_action :authenticate_user!
  before_action :skip_authorization


  def home
    # skip_authorization
    trips = Trip.where("DATE(starts_at) > ?", Date.today).sample(3)
    number_of_examples = [trips.length, 3].min
    @trips = trips.sample(number_of_examples)

  end

  def home_transporteur
    @disable_nav = true
    missions = Mission.where("DATE(starts_on) > ?", Date.today)
    number_of_examples = [missions.length, 3].min
    @missions = missions.sample(number_of_examples)
  end


end
