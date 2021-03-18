require 'rails_helper'

RSpec.describe 'Item API', type: :request do
  let(:user) { create(:user) }
  let(:items) { create_list(:item, 10) }

  describe 'GET /items' do
    before { get '/items' }

    it 'returns response 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /items/1' do
    before { get "/items/#{items[1].id}" }

    it 'returns a selected item' do
      expect(JSON.parse(response.body)).to_not be_empty
    end

    it 'returns response 200' do
      expect(response).to have_http_status(200)
    end
  end
end
