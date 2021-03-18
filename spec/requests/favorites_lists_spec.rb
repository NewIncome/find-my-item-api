require 'rails_helper'

RSpec.describe 'Favorites_List', test: :request do
  let(:user) { create(:user) }
  let(:items) { create_list(:item, 10) }
  let(:favorites_list) { build(:favorites_list, user_id: user.id, item_id: items[0].id) }

  describe 'GET /users/:user_id/favorites_lists' do
    before { get "/users/#{user.id}/favorites_lists" }

    it 'returns response 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users/:user_id/favorites_lists' do
    let(:valid_attributes) { { user_id: 1, item_id: 3 } }

    context 'when the request params are valid' do
      before { post "/users/#{user.id}/favorites_lists", params: valid_attributes }

      # it 'creates a new item' do
      #   expect(JSON.parse(response.body)).to_not be_empty
      # end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'DELETE /users/:user_id/favorites_lists/:id' do
    before { delete "/users/#{user.id}/favorites_lists/1" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
