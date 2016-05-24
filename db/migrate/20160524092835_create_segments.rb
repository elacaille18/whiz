class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.references :trip, index: true, foreign_key: true
      t.string :departure_city
      t.string :departure_station
      t.datetime :leaves_at
      t.string :arrival_city
      t.string :arrival_station
      t.datetime :arrives_at
      t.integer :train_number
      t.string :sequence_number

      t.timestamps null: false
    end
  end
end
