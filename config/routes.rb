Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :schools, only: %i[create update destroy] do
        resources :recipients, only: %i[index create]
        resources :orders, only: :index
      end
      resources :recipients, only: %i[update destroy]
      resources :orders, only: %i[create update]
    end
  end
end
