Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[update show]
      resources :blogs
      resources :payments, only: %i[create]
      resources :account_infos, only: %i[create]
    end
  end
end
