Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :questions
  devise_for :users

  root 'homes#new'
  get 'plays/index'
  post 'plays/answer'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
