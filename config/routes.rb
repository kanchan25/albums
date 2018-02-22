Rails.application.routes.draw do
  
  devise_for :users

  
    resources :albums do
	    resources :pictures do 
	  	  delete  :remove_tag, on: :member
	  	  resources :comments
	  end
	end

  resources :users

  root 'albums#index'

 

end
