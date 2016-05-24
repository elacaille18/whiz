class PagesController < ApplicationController

  # Allow visitor to see the home page
  skip_before_action :authenticate_user!, only: :home

  def home
  end
end
