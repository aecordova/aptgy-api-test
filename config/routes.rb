Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :school, only: %i[create update destroy] do
        resources :recipients, only: %i[index create]
      end
      resources :recipients, only: %i[update destroy]
      # resources :order, only: %i[create update destroy]
    end
  end
end
