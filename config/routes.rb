Rails.application.routes.draw do
  devise_for :users
  root 'mypages#index'
  resources :students, only: [:new, :create] do
    resources :reports, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
