require 'rails_helper'

RSpec.describe FavoritesList, type: :model do
  # Associtaions Tests
  it { should belong_to(:user).dependent(:destroy) }
  it { should have_many(:items) }
  # Validations Test
  it { should validate_presence_of(:user) }
  it { should validate_uniqueness_of(:user) }
  it { should validate_uniqueness_of(:items) }
end
