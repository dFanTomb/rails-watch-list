Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'lists#index'

  # post 'lists/:list_id/bookmarks', to: 'bookmarks#create', as: :list_bookmarks
  # get 'lists/:list_id/bookmarks/new', to: 'bookmarks#new', as: :new_list_bookmark
  # post 'lists/:list_id/reviews', to: 'reviews#create', as: :list_reviews
  # get 'lists', to: 'lists#index'
  # post 'lists', to: 'lists#create'
  # get 'lists/new', to: 'lists#new', as: :new_list
  # get 'lists/:id', to: 'lists#show'
  # delete 'lists/:id', to: 'lists#destroy'
  # delete 'bookmarks/:id', to: 'bookmarks#destroy', as: :bookmark
  # delete 'reviews/:id', to: 'reviews#destroy'

  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end
