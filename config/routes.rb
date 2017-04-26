Rails.application.routes.draw do

  get 'profile/index'

  get 'comment/index'

  get 'post/index'

  get 'user/index'

  resources :user
  resources :posts
  resources :comments
  resources :profiles
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
