class AddVideoTitleToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :video_title, :string
  end
end
