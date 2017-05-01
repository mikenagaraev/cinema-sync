class AddTimeAndStartToVideo < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :time, :integer, default: 0
    add_column :videos, :start, :boolean, default: false
  end
end
