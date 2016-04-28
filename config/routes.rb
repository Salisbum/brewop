Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :recipes do
      resources :comments
    end
  end

  root "pages#show", page: "home"

  get "/home/:page", to: "pages#show"

  authenticate :user do
    resources :profiles
    resources :batches

    get "/admin/:page", to: "admins#show"

    resources :recipes do
      resources :comments
      resources :ingredients
      resources :instructions
      resources :batches
    end
  end

end
