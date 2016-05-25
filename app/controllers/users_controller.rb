class UsersController < ApplicationController
  def profile
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :picture, :picture_cache)
  end
end
