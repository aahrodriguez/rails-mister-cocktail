Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cocktails#index'
  resources :cocktails, only: [:create, :index, :destroy, :new, :show] do
    resources :doses, only: [:create]
  end
end
