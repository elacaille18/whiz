class AddColumnToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :chosen, :boolean, default: false
    add_column :trips, :departure_longitude, :string
    add_column :trips, :departure_latitude, :string
    add_column :trips, :arrival_longitude, :string
    add_column :trips, :arrival_latitude, :string
  end
end
