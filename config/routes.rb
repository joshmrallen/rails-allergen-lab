Rails.application.routes.draw do
  resources :ingredients, only: [:index, :show]
  resources :users # gets all seven routes so we can delete users too
  resources :recipes, only: [:index, :show, :new, :create]
  # do I need to draw routes for the joint ables? No because the models go through the join tables and get what they need so I don't need to route the data from the joint ables to the client
  # also, you don't need controller files for models that don't have routes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
