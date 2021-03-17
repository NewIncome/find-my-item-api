Rails.application.routes.draw do
  resources :users, only: [:create] do
    resources :favorites_lists, only: %i[index create destroy]
  end
  resources :items, only: %i[index show]

  delete '/users/:user_id/favorites_lists/', to: 'favorites_lists#destroy'

  post '/login', to: 'users#login'
  post '/signup', to: 'users#signup'
  delete '/logout', to: 'users#logout'
end
