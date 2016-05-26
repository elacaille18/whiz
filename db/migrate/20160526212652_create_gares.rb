class CreateGares < ActiveRecord::Migration
  def change
    create_table :gares do |t|

      t.string :stop_point_id
      t.string :stop_area_id
      t.string :name
      t.string :label
      t.string :longitude
      t.string :latitude

      t.timestamps null: false

    end
  end
end



