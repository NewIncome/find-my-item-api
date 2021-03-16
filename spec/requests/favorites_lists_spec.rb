RSpec.describe 'Favorites_List', test: :request do
  # Initialize test data
  # Create User, Items(10), Favorites_List
  let(:user) { create(:user, 1) }
  let(:item) { create(:item, 10) }
  let(:favorites_list) { create(:favorites_list, 1) }

  # GET a signed in User's favorite items list
  describe 'GET /favorites_lists/1' do
    before { get '/favorites_lists/1' }

    it 'returns a selected users favorite list' do
      expect(JSON.parse(response.body)).to_not be_empty
    end

    it 'returns response 200' do
      expect(response).to have_http_status(200)
    end
  end

  # show error screen if user is not logged_in 4 all ops

  # POST, add an Item to the logged-in User's list
  describe 'POST /favorites_lists' do
    let(:valid_attributes) { { user:id:1, item_id:3 } }

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

  # Can remove an Item from a logged-in User's list
  describe 'DELETE /favorites_lists/:id' do
    before { delete '/favorites_lists/1' }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
