Rails.application.routes.draw do
  root "homes#top"
  get "about" => "homes#about"
  get "admin" => "users#mg"

  resources :users do
    resource :password, only:[:edit, :update]
    collection do
      post :login
      get :login_form
      get :logout
    end
  end

  resources :posts

  resources :likes, only: [:update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
