Rails.application.routes.draw do
  scope '/api' do
    scope '/links' do
      get 'index', to: 'links#index'
      post 'store/:link_params', to: 'links#store'
    end
  end
end
