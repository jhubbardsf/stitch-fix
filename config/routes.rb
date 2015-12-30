Rails.application.routes.draw do
  resources :clothings
  resources :clearance_batches, only: [:index, :create] do
    resources :items, only: [:index]
  end
  resources :items
  root to: "clearance_batches#index"

  get  'report/:id', to: 'clearance_batches#report', as: :report
  get  'report_pdf/:id', to: 'clearance_batches#report_pdf', as: :pdf
  get  'manual_input', to: 'clearance_batches#manual_input', as: :manual_input
  post 'process_manual', to: 'clearance_batches#process_manual', as: :process_manual
end
