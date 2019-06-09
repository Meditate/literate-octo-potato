Rails.application.routes.draw do
  scope module: :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :games, only: [:create], param: :key do
        get :current_state
      end
      resources :throws, only: [:create]
    end
  end
end
