Rails.application.routes.draw do 


 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users do

  resources :subs, only: :new
  resources :posts, only: :new
end

resource :session

resources :subs, except: :new

resources :posts, except: [:index, :new] do  
  resources :comments, only: :new
end

resources :comments, except: :new

end
