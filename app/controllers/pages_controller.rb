class PagesController < ApplicationController
  # Allow visitor to see the home page
  skip_before_action :authenticate_user!, only: :home
  skip_after_action :verify_authorized, only: :home

  def home
  end

end
