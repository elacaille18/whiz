class AddPhotoToMission < ActiveRecord::Migration
  def change
    add_column :missions, :photo, :string
  end
end
