Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create]
  end
  resources :registered_applications

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
