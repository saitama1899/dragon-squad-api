class CreateRoomStats < ActiveRecord::Migration[6.0]
  def change
    create_table :room_stats do |t|
      t.references :room, null: false, foreign_key: true
      t.string :request_ip, null:false

      t.timestamps
    end
  end
end
