Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmlr
  root to: 'cocktails#index'

resources :cocktails
resources :doses, only: [:create, :new, :destroy, :show]
resources :ingredients, only: [:create, :new, :destroy, :show]

end
