require 'rails_helper'

RSpec.describe 'Redirection', type: :request do
  let(:links) { create_list(:link, 10) }

  describe 'redirect' do

    context 'when there is such link' do
      before { get redirect_path(links.first.shortened) }

      it 'redirects successfully with 302' do
        expect(response).to have_http_status(302)
      end
    end

    context 'when there is no such link' do
      before { get redirect_path(links.first.shortened + 'randomsalt') }

      it 'responds with unprocessable entity' do
        expect(response).to have_http_status(422)
      end

      it 'returns \'bad link\'' do
        expect(json['error']).to eq('bad link')
      end
    end

  end
end
