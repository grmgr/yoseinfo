Rails.application.routes.draw do
  devise_for :users,
  controllers: {registrations: 'registrations'}  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'


  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
  # get '/posts/new', to: 'posts#new'
  # post '/posts', to: 'posts#create'
  # post '/posts/:post_id/photos', to: 'photos#create', as: 'post_photos'

end
