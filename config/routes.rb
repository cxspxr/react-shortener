Rails.application.routes.draw do
  scope '/api' do
    get 'links', to: 'links#index'
  end
end
