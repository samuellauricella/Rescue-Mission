Rails.application.routes.draw do
	resources :questions do 
		resources :comments
	end
end
