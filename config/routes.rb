Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :tasks do
    resources :comments, only: :create
  end
end
