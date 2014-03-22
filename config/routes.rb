LittlehumansApp::Application.routes.draw do

  devise_for :users, 
             :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
							   :registrations => "users/registrations", 
							   :passwords => 'users/passwords'
             				 }

  resources :users, :only => [:index, :show, :edit, :update]

  devise_scope :user do
  	root :to => "devise/sessions#new"
  	# root :to => 'devise/sessions#new'
   #  get "/users/sign_in" => "devise/sessions#new", :as => :login
   #  get "/users/sign_up" => "devise/sessions#create", :as => :signup
  end

  # authenticated :user do
  #   root :to => "devise/sessions#new", :as => "authenticated_root"
  #   # Rails 4 users must specify the 'as' option to give it a unique name
  #   # root :to => "main#dashboard", :as => "authenticated_root"
  # end

  # tell devise to use scope users
  # devise_scope :user do
  # 	root :to => 'devise/sessions#new'
  # end

end