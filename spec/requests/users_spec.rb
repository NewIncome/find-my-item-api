require 'rails_helper'

RSpec.describe 'User API', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) { { name: 'Panchito' } }

  describe 'POST /users' do
    before { post '/users', params: valid_attributes }

    it "returns the user's info" do
      expect(JSON.parse(response.body)).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
