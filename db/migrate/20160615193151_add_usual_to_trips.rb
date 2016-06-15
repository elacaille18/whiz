class AddUsualToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :usual, :boolean
  end
end
