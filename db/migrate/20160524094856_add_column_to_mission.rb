class AddColumnToMission < ActiveRecord::Migration
  def change
    add_column :missions, :receiver_email, :string
  end
end
