Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :update, :create, :destory] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
    resources :likes, only: [:index]
    resources :collections, only: [:index]
  end

  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # post 'users', to: 'users#create'
  # patch 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destory'
  resources :artworks, only: [:show, :update, :create, :destory] do
    resources :comments, only: [:index]
    resources :likes, only: [:index]
    member do
      patch 'favorite'
    end
  end

  resources :artworkshares, only: [:create, :destory] do
    # member do
    #   patch 'favorite'
    # end
  end

  resources :comments, only: [:create, :destroy] do
    resources :likes, only: [:index]
  end

  resources :likes, only: [:create, :destory]

  resources :collections, only: [:create, :destory, :show]

end
