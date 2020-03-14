Rails.application.routes.draw do
  devise_for :users
  root 'mypages#index'
  resources :users, only: [:index, :edit, :update]
  resources :students, only: [:new, :create, :edit, :update, :destroy] do
    resources :reports, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
