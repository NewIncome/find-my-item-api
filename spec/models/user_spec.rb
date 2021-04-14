require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:favorites_list).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name) }
end
