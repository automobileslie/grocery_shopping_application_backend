Rails.application.routes.draw do

  get '/receipts/:receipt_id/points', to: 'receipts#process'
  post '/receipts/process', to: 'receipts#process'
  get '/receipts', to: 'receipts#index'

  resources :items, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
