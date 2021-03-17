RSpec.describe 'User API', type: :request do
  let(:user1) { create(:user, 1) }
  let(:valid_attributes) { { name: 'Panchito' } }

  describe 'GET /user/2' do
    before { post '/users', params: valid_attributes }

    it 'returns the new user profile' do
      expect(JSON.parse(response.body)['name']).to eq('Panchito')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end

  describe 'GET /user/1' do
    before { get '/user/1' }

    it 'returns the logged in user profile' do
      expect(JSON.parse(response.body)).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
