class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :picture, :description, :picture_cache, :password, :password_confirmation, :current_password)
  end

#Allow to update user without password
  # protected

  # def update_resource(resource, params)
  #   resource.update_without_current_password(params)
  # end

end
