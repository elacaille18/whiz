ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  # permit_params :first_name
  # index do
  #   selectable_column
  #   column :id
  #   column :email
  #   column :created_at
  #   column :admin
  #   actions
  # end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
    f.inputs "Identity" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  permit_params :last_name, :first_name, :email, :admin, :password
end
