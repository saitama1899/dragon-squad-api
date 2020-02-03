# frozen_string_literal: true

class RoomStat < ApplicationRecord
  belongs_to :room
  validates_presence_of :request_ip
end
