Rails.application.routes.draw do
  root "houses#index"
  resources :houses, only: [:new, :create, :index, :show] do
    resources :members, only: [:index, :create, :new]
  end
end
