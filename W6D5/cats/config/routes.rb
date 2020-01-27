Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats do
    resources :cat_rental_requests, only:[:index] do
      member do
        get "deny"
      end
      member do
        get 'approve'
      end
    end
  
  end

  resources :cat_rental_requests, only:[:new, :create] 

end
