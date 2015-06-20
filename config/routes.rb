Rails.application.routes.draw do
  devise_for :users
  root 'empresas#index'
  resources :empresas do
    member do
      get :produtos
    end
  end 
end
