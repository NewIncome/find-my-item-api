require 'rails_helper'

RSpec.describe FavoritesList, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:item) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:item) }
  it { should validate_presence_of(:user_item) }
end
