# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :description
      t.string :owner
      t.numeric :price
      t.numeric :lat
      t.numeric :lng

      t.timestamps
    end
  end
end
