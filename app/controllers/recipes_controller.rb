class RecipesController < ApplicationController
  load_and_authorize_resource
  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new

  end

  def show
    @recipe = Recipe.where(id: params[:id]).includes(:recipe_foods).take
    @inventories = current_user.inventories.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(params.require(:recipe).permit(:public))
  end

  def public_recipes
    @recipes = Recipe.where({ public: true }).order(created_at: :desc).includes(:user)
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    flash[:notice] = 'Recipe is Created!' if @recipe.save
    redirect_to user_recipes_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe
    @recipe.destroy
    flash[:notice] = 'Recipe has been destroyed!'
    redirect_to user_recipes_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
