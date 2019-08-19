require 'rails_helper'

RSpec.describe "SlackUsers", type: :request do
  # initialize test data
  let!(:slack_users) { create_list(:slack_user, 10) }
  let(:slack_user_id) { slack_users.first.id }

  describe "GET /slack_users" do
    before { get '/slack_users.json' }

    it "returns slack_users" do
      get slack_users_path
      expect(response.body).not_to be_empty
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /slack_users/:id
  describe 'GET /slack_users/:id' do
    before { get "/slack_users/#{slack_user_id}.json" }

    context 'when the record exists' do
      it 'returns the slack_user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(slack_user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:slack_user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find SlackUser/)
      end
    end
  end



  # Test suite for POST /slack_users
  describe 'POST /slack_users' do
    # valid payload
    let(:valid_attributes) {
      {
        "id" => 'R8392DkkkK',
        "name" => 'tobygooop',
        "real_name" => 'Toby Guuuuu',
        "profile" => {
          'team' => 'DJIJIO'
        }
      } }
    context 'when the request is valid' do
      before { post '/slack_users.json', params: valid_attributes }

      it 'creates a slack user' do
        expect(json['name']).to eq('tobygooop')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/slack_users.json', params: { "name" => 'ThisIsAll' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

    end
  end

  # Test suite for PUT /slack_users/:id
  # describe 'PUT /slack_users/:id' do
  #   let(:valid_attributes) { { slack_user: { slack_user_id: 'R8392DK', name:'guutoby', real_name: 'Gu Toby' } } }
  #
  #   context 'when the record exists' do
  #     before { put "/slack_users/#{slack_user_id}.json", params: valid_attributes }
  #
  #     it 'updates the record' do
  #       expect(json['name']).to eq('guutoby')
  #     end
  #
  #     it 'returns status code 200' do
  #       expect(response).to have_http_status(200)
  #     end
  #   end
  # end

  # Test suite for DELETE /slack_users/:id
  # describe 'DELETE /slack_users/:id' do
  #   before { delete "/slack_users/#{slack_user_id}.json" }
  #
  #   it 'returns status code 200' do
  #     expect(response).to have_http_status(204)
  #   end
  # end



end
