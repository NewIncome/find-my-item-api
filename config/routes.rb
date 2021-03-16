Rails.application.routes.draw do
  get 'favorites_lists/index'
  get 'favorites_lists/show'
  get 'favorites_lists/create'
  get 'favorites_lists/update'
  get 'favorites_lists/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :favorites_lists
  end
  resources :items
end

=begin    >>>>> ROUTES <<<<<
              Prefix Verb   URI Pattern                                      Controller#Action
user_favorites_lists GET    /users/:user_id/favorites_lists(.:format)        favorites_lists#index
                     POST   /users/:user_id/favorites_lists(.:format)        favorites_lists#create
 user_favorites_list GET    /users/:user_id/favorites_lists/:id(.:format)    favorites_lists#show
                     PATCH  /users/:user_id/favorites_lists/:id(.:format)    favorites_lists#update
                     PUT    /users/:user_id/favorites_lists/:id(.:format)    favorites_lists#update
                     DELETE /users/:user_id/favorites_lists/:id(.:format)    favorites_lists#destroy
               users GET    /users(.:format)                                 users#index
                     POST   /users(.:format)                                 users#create
                user GET    /users/:id(.:format)                             users#show
                     PATCH  /users/:id(.:format)                             users#update
                     PUT    /users/:id(.:format)                             users#update
                     DELETE /users/:id(.:format)                             users#destroy
               items GET    /items(.:format)                                 items#index
                     POST   /items(.:format)                                 items#create
                item GET    /items/:id(.:format)                             items#show
                     PATCH  /items/:id(.:format)                             items#update
                     PUT    /items/:id(.:format)                             items#update
                     DELETE /items/:id(.:format)                             items#destroy
=end
