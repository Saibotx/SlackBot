Rails.application.routes.draw do
  resources :slack_users do
    resources :slack_user_profile
  end

  post '/slack_users/update', to: 'slack_users#sync'

  root to: 'application#index'
  resources :application, :only => [:index, :create], :path => "/"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
