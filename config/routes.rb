Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"

  # resources :foods, only: %i[index show]
 
  resources :users, only: %i[index show] do 
    resources :foods
    resources :inventories
    resources :shopping_list
    resources :recipe_foods
    resources :recipes do
      resources :recipe_foods
    end

   
    resources :shopping_list, only: %i[index show]
    resources :inventories do
      resources :inventory_foods, only: %i[new create destroy]
    end

  end
  
  get 'public_recipes', to: 'recipes#public_recipes'
end
