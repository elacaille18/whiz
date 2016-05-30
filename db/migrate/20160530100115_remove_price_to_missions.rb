class RemovePriceToMissions < ActiveRecord::Migration
  def change
    remove_column :missions, :price
  end
end
