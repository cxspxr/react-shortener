require 'rails_helper'

RSpec.describe 'Links API', type: :request do
  let!(:links) { create_list(:link, 10) }
  let(:link_id) { link.first.id }

  describe 'all' do
    before { get links_index_path }

    it 'returns all the links' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'count' do
    before { get links_count_path }

    it 'counts all the links' do
      expect(json).to eq(10)
    end
  end

  describe 'store' do
    # valid payload
    let(:valid_attributes) { {
      url: Faker::Internet.url,
      shortened: Faker::FamilyGuy.character
    } }

    context 'when the request is valid' do
      before { post links_store_path, params: valid_attributes }

      it 'stores a link' do
        expect(json['url']).to eq(valid_attributes[:url])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post links_store_path, params: { url: valid_attributes[:url] } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Shortened can't be blank/)
      end
    end
  end
end
