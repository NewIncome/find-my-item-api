RSpec.describe 'Favorites_List', test: :request do
  let(:user) { create(:user, 1) }
  let(:item) { create(:item, 10) }
  let(:favorites_list) { create(:favorites_list, 1) }

  describe 'GET /favorites_lists/1' do
    before { get '/favorites_lists/1' }

    it 'returns a selected users favorite list' do
      expect(JSON.parse(response.body)).to_not be_empty
    end

    it 'returns response 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /favorites_lists' do
    let(:valid_attributes) { { user_id: 1, item_id: 3 } }

    context 'when the request params are valid' do
      before { post '/favorites_list/1', params: valid_attributes }

      it 'creates a new item' do
        expect(JSON.parse(response.body)).to_not be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'DELETE /favorites_lists/:id' do
    before { delete '/favorites_lists/1' }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
