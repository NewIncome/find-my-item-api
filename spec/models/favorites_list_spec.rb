require 'rails_helper'

RSpec.describe FavoritesList, type: :model do
  # Associtaions Tests
  it { should belong_to(:user).dependent(:destroy) }
  it { should belong_to(:item) }
  # Validations Test
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:item) }
  it { should validate_presence_of(:user_item) }
end
