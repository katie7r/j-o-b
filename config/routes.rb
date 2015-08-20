Rails.application.routes.draw do
  devise_for :users

  resources :postings

  get "/pages/*id" => 'pages#show', as: :page, format: false

  root to: 'pages#show', id: 'home' # high_voltage

end
