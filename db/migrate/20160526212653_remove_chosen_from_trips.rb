class RemoveChosenFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :chosen, :boolean
  end
end
