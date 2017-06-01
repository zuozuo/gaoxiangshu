Rails.application.routes.draw do
  resources :applies
  resources :colleges
  resources :news
  resources :users
  resources :students, only: [:show, :edit, :update, :index] do
    resources :lessions do
      post :generate, on: :collection
    end
    resources :course_students
    resources :lession_times
    get :courses
  end
  resources :teachers, only: [:show, :edit, :update, :index] do
    get :courses
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
