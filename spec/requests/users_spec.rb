require 'rails_helper'

RSpec.describe 'User API', type: :request do
  let(:user1) { create(:user) }
  let(:valid_attributes) { { user: { name: 'Panchito' } } }

  describe 'POST /users' do
    before { post '/users', params: valid_attributes }

    it "returns the user's info after a login" do
      expect(JSON.parse(response.body)).not_to be_empty
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end

  describe 'POST /login' do
    before { post '/login', params: { name: user1.name } }

    it "returns the user's info after a login" do
      # post '/login', :params => { :name => user1.name }
      expect(JSON.parse(response.body)).not_to be_empty
    end

    it 'returns status code 202' do
      expect(response).to have_http_status(202)
    end
  end
end
