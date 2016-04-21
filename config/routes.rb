Rails.application.routes.draw do
  devise_for :users

  root "pages#show", page: "home"

  get "/pages/:page" => "pages#show"

  authenticate :user do
    resources :recipes do
      resources :comments
    end
  end

  resources :profiles
end
