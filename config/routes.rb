Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root :to => 'owner#index'

  get '/:owner_name/articles' => 'owner#articles'
	get '/:articles/:id' => 'article#show'
	get '/owners' => 'owner#index'
	get '/:owner_name' => 'owner#show'

end
