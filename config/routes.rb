Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }


  get 'welcome/index'
 
  resources :articles do
  	resources :comments
  end
#   scope module: 'proxy' do
#   resources :admin
# end
  # resources :admin, only: [:index]

  resources :admin
	

  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
end
