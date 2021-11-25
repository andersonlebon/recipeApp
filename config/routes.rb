Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"

  # resources :foods, only: %i[index show]
 
  resources :users, only: %i[index show] do 
    resources :foods, only: %i[index show new]
    resources :inventories, only: %i[index show]
    resources :recipe_foods, only: %i[update, edit]
    resources :recipes, only: %i[index show new create destroy update] do
      resources :recipe_foods, only: %i[new create destroy]
    end
  end
  
  get 'public_recipes', to: 'recipes#public_recipes'
  get 'general_shopping_list', to: 'general_shopping_lists#index'
end
