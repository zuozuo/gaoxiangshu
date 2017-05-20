Rails.application.routes.draw do
  get 'teachers/show'

  get 'teachers/edit'

  get 'teachers/update'

  resources :courses
  resources :applies
  resources :colleges
  resources :news
  resources :users
  resources :students, only: [:show, :edit, :update]
  resources :teachers, only: [:show, :edit, :update]
  get 'home/index'
  root to: 'home#index'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
