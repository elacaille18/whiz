class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true
      t.string :receiver_first_name
      t.string :receiver_last_name
      t.string :receiver_phone
      t.string :departure_city
      t.string :arrival_city
      t.date :starts_on
      t.string :timeslot
      t.string :status
      t.string :start_code
      t.string :end_code
      t.float :price
      t.string :parcel_description

      t.timestamps null: false
    end
  end
end
