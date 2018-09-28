require 'rails_helper'

RSpec.describe 'Redirection', type: :request do
  let(:links) { create_list(:link, 10) }

  describe 'redirect' do

    context 'when there is such link' do
      before { get redirect_path(links.first.shortened) }

      it 'redirects successfully with 302' do
        expect(response).to have_http_status(302)
      end
      
      it 'creates a redirect for this link' do
        expect(links.first.redirects.any?).to be_truthy
        expect(links.first.redirects.count).to eq(1)
      end      
    end

    context 'when there is no such link' do
      before { get redirect_path(links.first.shortened + 'randomsalt') }

      it 'responds with unprocessable entity' do
        expect(response).to have_http_status(422)
      end
      
      it 'doesnt create any redirects' do
        expect(Redirect.any?).to_not be_truthy        
      end

      it 'returns \'bad link\'' do
        expect(json['error']).to eq('bad link')
      end
    end

  end
end
