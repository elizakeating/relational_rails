Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/orchestras", to: "orchestras#index"
  get "/orchestras/new", to: "orchestras#new"
  post "/orchestras", to: "orchestras#create"
  get "/orchestras/:id", to: "orchestras#show"
  get "/orchestras/:id/edit", to: "orchestras#edit"
  patch "/orchestras/:id", to: "orchestras#update"
  delete "/orchestras/:id", to: "orchestras#destroy"
  
  get "/orchestras/:id/musicians", to: "orchestra_musicians#index"
  get "/orchestras/:id/musicians/new", to: "orchestra_musicians#new"
  post "/orchestras/:id/musicians", to: "orchestra_musicians#create"
  get "/orchestras/:id/musicians/threshold", to: "orchestra_musicians#threshold"

  get "/musicians", to: "musicians#index"
  get "/musicians/:id", to: "musicians#show"
  get "/musicians/:id/edit", to: "musicians#edit"
  patch "/musicians/:id", to: "musicians#update"
  delete "/musicians/:id", to: "musicians#destroy"
end
