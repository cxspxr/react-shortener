Rails.application.routes.draw do
  scope '/api' do
    scope '/links', as: 'links' do
      get 'index', to: 'links#index', as: 'index'
      post 'store', to: 'links#store', as: 'store'
    end
  end
end
