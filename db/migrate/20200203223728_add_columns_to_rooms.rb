class AddColumnsToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms,:bills_included, :boolean
    add_column :rooms,:deposit, :boolean
    add_column :rooms,:verified, :boolean
    add_column :rooms,:roommate_girls, :integer
    add_column :rooms,:roommate_boys, :integer
    add_column :rooms,:room_size, :integer
    add_column :rooms,:property_size, :integer
  end
end
