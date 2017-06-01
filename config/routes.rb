Rails.application.routes.draw do
  devise_for :users, controllers:{
  	sessions: 'users/sessions',
  	registrations: 'users/registrations'
  	omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do 
  	delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'users#index'

  get '/user/:id/profile' => 'users#profile'

  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  get '/post/:id/show' => 'posts#show'
  post '/post/:id/increment_number_of_likes' => 'posts#increment_number_of_likes'
  post '/post/:id/decrement_number_of_likes' => 'posts#decrement_number_of_likes'

  post '/friendships' => 'friendships#create'
  delete '/friendships' => 'friendships#destroy'

  post '/friendships/send_request' => 'friendships#send_request'
end
