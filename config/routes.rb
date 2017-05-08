Rails.application.routes.draw do

  get 'home/sign-in'

  get "home/index"
  root "home#index"

  resources :users do
    resources :profiles
end

  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
