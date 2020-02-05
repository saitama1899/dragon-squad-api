# frozen_string_literal: true

class AddColumnTotalRooms < ActiveRecord::Migration[6.0]
  def change
    add_column 'locations', 'total_rooms', :integer, default: 0
  end
end
