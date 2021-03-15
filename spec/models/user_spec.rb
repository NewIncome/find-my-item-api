require 'rails_helper'

RSpec.describe User, type: :model do
  # Association Test
  it { should have_one(:favorites_list).dependent(:destroy) }
  # Validation Test
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name) }
end
