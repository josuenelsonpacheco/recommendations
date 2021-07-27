Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :collections
  resources :collects
  

  get "/recommendations/available-collection-seeds", to: "recommendations#available_collection_seeds"
  get "/collections/:id/products", to: "collections#collection_products"


  put "/user-history", to: "user_history#update" 

#get "/recommendations/products", to: "recommendations#products"
#get "/recommendations/deals", to: "recommendations#deals"
#get "/recommendations/posts", to: "posts#index"
#root "hammer_users#index"
#get "/hammer_users", to: "hammer_users#index"
#get "/articles", to: "articles#index"
#resources :articles


  #namespace :recommendations do
  #  resources :collections_seeds
  #end
   
end