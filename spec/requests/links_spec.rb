require 'rails_helper'

RSpec.describe 'Links API', type: :request do
  let!(:links) { create_list(:link, 10) }
  let(:link_id) { link.first.id }

  describe 'GET /api/links' do
    before { get '/api/links' }

    it 'returns all the links' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
