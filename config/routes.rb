Rails.application.routes.draw do

  root 'static#index'

  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/user/:id', to: 'user#show'
  get '/posts/modal/:id', to: 'posts#modal'
end
