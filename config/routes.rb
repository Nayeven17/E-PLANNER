Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[create destroy]
  end

  resources :bookings, only: %i[index edit update destroy]
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
