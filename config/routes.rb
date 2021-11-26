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
  end
  
  get 'public_recipes', to: 'recipes#public_recipes'
end
