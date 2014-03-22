LittlehumansApp::Application.routes.draw do
  #resources :users

  #devise_for :users

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "users#index"

end
