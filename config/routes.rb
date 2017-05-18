Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]

  root 'usermanagements#index'
  resources :users
  resources :lessons
  resources :instructors
  resources :usermanagements
  resources :instructorlessons
  resources :studentlessons
end