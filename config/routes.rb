Rails.application.routes.draw do

  resources :admin
  resources :customer_services do
    get :students
    get :lessions
  end
  resources :applies
  resources :colleges
  resources :news
  resources :users
  resources :lessions, only: [:show] do
    post :create_webex_meeting
  end
  resources :students do
    resources :lessions do
      post :generate, on: :collection
    end
    resources :course_students
    resources :lession_times
    get :courses
  end
  resources :teachers do
    get :courses
    get :students
    resources :availible_times
  end

  resources :course_teachers, only: [:create, :destroy]
  resources :courses do
    get :teachers
  end
  get 'home/index'
  root to: 'home#index'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
