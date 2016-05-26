class ChangeStatusdefaultInTrips < ActiveRecord::Migration
  def change
    change_column_default :trips, :status, "free"
  end
end
