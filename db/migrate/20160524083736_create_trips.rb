class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :departure_city
      t.string :arrival_city

      t.timestamps null: false
    end
  end
end
