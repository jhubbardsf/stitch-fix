Rails.application.routes.draw do
  resources :clothings
  resources :clearance_batches, only: [:index, :create] do
    resources :items, only: [:index]
  end
  resources :items
  root to: "clearance_batches#index"

  get 'report/:id', to: 'clearance_batches#report', as: :report
  get 'report_pdf/:id', to: 'clearance_batches#report_pdf', as: :pdf
end
