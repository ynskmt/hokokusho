Rails.application.routes.draw do
  devise_for :users
  root 'mypages#index'
  resources :students, only: [:new, :create]
end
