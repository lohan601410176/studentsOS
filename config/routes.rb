Rails.application.routes.draw do

  get 'search/class_find'
  get 'search/student_find'
  get 'search/index_student'
  get 'search/index'

  resources :students
  resources :teachers
  resources :homes
  # devise_for :admins
  devise_for :user


  root :to => 'homes#index'
end
