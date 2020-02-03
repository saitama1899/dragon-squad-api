class RoomStat < ApplicationRecord
  belongs_to :room
  validate_presence_of :request_ip
end
