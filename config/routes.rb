Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create] do
    resources :favorites_lists, only: %i[index create destroy]
  end
  resources :items, only: %i[index show]

  post '/login', to: 'users#login'
  post '/signup', to: 'users#signup'
  # get '/utest', to: 'users#test'
  # get '/fltest', to: 'favorites_lists#test'
  delete '/logout', to: 'users#logout'
end

=begin    >>>>> ROUTES <<<<<
              Prefix Verb   URI Pattern                                     Controller#Action
user_favorites_lists GET    /users/:user_id/favorites_lists(.:format)       favorites_lists#index
                     POST   /users/:user_id/favorites_lists(.:format)       favorites_lists#create
 user_favorites_list DELETE /users/:user_id/favorites_lists/:id(.:format)   favorites_lists#destroy
               items GET    /items(.:format)                                items#index
                item GET    /items/:id(.:format)                            items#show
               login POST   /login(.:format)                                users#login
              signup POST   /signup(.:format)                               users#signup
              logout DELETE /logout(.:format)                               users#logout
=end
