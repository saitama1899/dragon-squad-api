require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should have_many(:photos).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should belong_to(:location)}
end
