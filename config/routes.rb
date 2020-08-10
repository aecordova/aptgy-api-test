Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :schools, only: %i[create update destroy] do
        resources :recipients, only: %i[index create]
        resources :orders, only: %i[index create]
      end
      resources :recipients, only: %i[update destroy]
      resources :orders, only: :update
      resources :order_items, only: %i[update destroy]
    end
  end
end
