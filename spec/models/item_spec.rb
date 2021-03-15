require 'rails_helper'

RSpec.describe Item, type: :model do
  # Validation Tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:name) }
  it { should validate_length_of(:description) }
end
