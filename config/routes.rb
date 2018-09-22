Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :invoices, only: [:index, :create, :update, :new, :edit, :show] do
    resources :collections, only: [:index, :create, :new]
    collection do
      get 'pending'
      get 'collected'
    end
  end
end
