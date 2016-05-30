class AddPriceToMissions < ActiveRecord::Migration
  def change
    add_monetize :missions, :price, currency: {present: false}
  end
end
