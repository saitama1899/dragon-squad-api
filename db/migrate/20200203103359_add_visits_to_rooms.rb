class AddVisitsToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :visits, :integer, default: 0
  end
end
