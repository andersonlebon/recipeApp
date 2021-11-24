Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"

  # resources :foods, only: %i[index show]
 
  resources :users, only: %i[index show] do 
    resources :foods, only: %i[index show]
    resources :recipes, only: %i[index show]
    resources :inventories do
      resources :inventory_foods, only: %i[new create destroy]
    end

  end
end
