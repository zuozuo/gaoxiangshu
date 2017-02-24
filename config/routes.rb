Rails.application.routes.draw do
  resources :colleges
  resources :news
  devise_for :users
  resources :users
  get 'home/index'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
