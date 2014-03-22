LittlehumansApp::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # tell devise to use scope users
  devise_scope :user do
  	root :to => 'devise/sessions#new'

  end

end
