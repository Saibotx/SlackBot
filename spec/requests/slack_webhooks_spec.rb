require 'rails_helper'

RSpec.describe "SlackWebhook", type: :request do
  # initialize test data
  let!(:slack_users) { create_list(:slack_user, 10) }
  let(:slack_user_id) { slack_users.first.id }

  # Test suite for POST /
  describe 'POST /' do
    # valid payload

    let(:valid_attributes) { { slack_user: {slack_user_id: 'R8392DK', name: 'tobygu', real_name: 'Toby Gu'} } }

    context 'when the request is valid' do
      before { post '/', params: valid_attributes }

      it 'creates a slack user' do
        expect(json['name']).to eq('tobygu')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/slack_users', params: { slack_user_id: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

    end
  end



end
