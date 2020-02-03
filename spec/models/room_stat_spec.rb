require 'rails_helper'

RSpec.describe RoomStat, type: :model do
  it { should belong_to(:room) }
  it { should validate_presence_of(:request_ip) }
end
