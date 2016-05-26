class UsersController < ApplicationController
  def profile
    @user = current_user()
    authorize @user
  end

  def show_card
    @user = User.find(params[:id])
    authorize @user
    respond_to do |format|
      # format.html { render 'trips/search' }
      format.js
    end
  end
end
