Rails.application.routes.draw do

  root 'static#index'
  get '/contact', to: 'static#contact'
  get '/admin', to: 'static#admin'
  get '/timeline', to: 'static#timeline'
  
  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }

  get '/user/:id', to: 'user#show'
  get '/posts/modal/:id', to: 'posts#modal'
end
