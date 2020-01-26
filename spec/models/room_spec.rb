require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should have_many(:photos).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:lat) }
  it { should validate_presence_of(:lng) }
  # it { should validate_length_of(:lat).is_at_least(40).is_at_most(42) } # Barcelona
  # it { should validate_length_of(:lng).is_at_least(1).is_at_most(3) }
end
