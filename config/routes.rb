Rails.application.routes.draw do
  resources :clearance_batches, only: [:index, :create]
  resources :items
  root to: "clearance_batches#index"
end
