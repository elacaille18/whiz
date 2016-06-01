class AddPaymentToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :payment, :json
  end
end
