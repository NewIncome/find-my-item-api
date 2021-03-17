RSpec.describe 'Item API', type: :request do
  # Initialize test data
  # Create a user, items(10)
  let(:user) { create(:user, 1) }
  let(:item) { create(:item, 10) }

  # GET all the available items
  describe 'GET /items' do
    before { get '/items' }

    it 'returns all items' do
      expect(JSON.parse(response.body).size).to eq(10)
    end

    it 'returns response 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /items/:id
  describe 'GET /items/1' do
    before { get '/items/1' }

    it 'returns a selected item' do
      expect(JSON.parse(response.body)).to_not be_empty
    end

    it 'returns response 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite POST /items
  describe 'POST /items' do
    let(:valid_attributes) do
      { name: 'item1',
        description: 'item description' }
    end

    context 'when the request params are valid' do
      before { post '/item/11', params: valid_attributes }

      it 'creates a new item' do
        expect(JSON.parse(response.body)).to_not be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
