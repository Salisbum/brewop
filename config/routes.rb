Rails.application.routes.draw do
  devise_for :users

  root "pages#show", page: "home"

  get "/home/:page", to: "pages#show"

  authenticate :user do
    resources :profiles

    get "/admin/:page", to: "admins#show"

    resources :recipes do
      resources :comments
      resources :batches
    end
  end

end
