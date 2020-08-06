Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :school, only: %i[create update destroy]
      # resources :recipient, only: %i[create update destroy]
      # resources :order, only: %i[create update destroy]
    end
  end
end
