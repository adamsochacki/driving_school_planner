Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]

  root 'usermanagements#index'
  resources :users
  resources :lessons
  resources :instructors
  resources :students
  resources :usermanagements
  resources :instructorlessons
  resources :studentlessons
end