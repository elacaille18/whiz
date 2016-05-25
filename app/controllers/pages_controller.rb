class PagesController < ApplicationController

  # Allow visitor to see the home page and the home page for transporteur
  skip_before_action :authenticate_user!
  before_action :skip_authorization


  def home
    # skip_authorization
  end

  def home_transporteur
    @disable_nav = true
  end

end
