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

  describe 'get' do
    # valid payload
    let(:valid_attributes) { {
      url: Faker::Internet.url,
      shortened: Faker::FamilyGuy.character
    } }

    before { post links_get_path, params: { url: valid_attributes[:url] }}

    context 'when there is a link' do
      before { post links_store_path, params: valid_attributes }

      it 'returns shortened for it' do
        expect(json).not_to be_empty
        expect(json['shortened']).to eq(valid_attributes[:shortened])
      end
    end

    context 'when there is no link' do
      it 'returns nothing' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
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

    context 'when there is only url' do
      before { post links_store_path, params: { url: valid_attributes[:url] } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Shortened can't be blank/)
      end
    end

    context 'when there is only shortened' do
      before { post links_store_path, params: { shortened: valid_attributes[:shortened] } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Url can't be blank/)
      end
    end

    context 'when there is the same url' do
      before { post links_store_path, params: {
        url: valid_attributes[:url],
        shortened: Faker::Name.unique.name
      } }
      before { post links_store_path, params: {
        url: valid_attributes[:url],
        shortened: Faker::Name.unique.name
      } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Url has already been taken/)
      end
    end

    context 'when there is the same shortened' do
      before { post links_store_path, params: {
        url: Faker::Internet.unique.url,
        shortened: valid_attributes[:shortened]
      } }
      before { post links_store_path, params: {
        url: Faker::Internet.unique.url,
        shortened: valid_attributes[:shortened]
      } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Shortened has already been taken/)
      end
    end
  end
end
