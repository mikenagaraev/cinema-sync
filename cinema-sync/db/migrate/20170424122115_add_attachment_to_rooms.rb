class AddAttachmentToRooms < ActiveRecord::Migration[5.0]
  def up
    add_attachment :rooms, :image
  end

  def down
    remove_attachment :rooms, :image
  end
end
