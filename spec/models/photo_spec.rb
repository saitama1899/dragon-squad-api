require 'rails_helper'

RSpec.describe Photo, type: :model do
    it { should belong_to(:room) }
    it { should validate_presence_of(:url) }
end
