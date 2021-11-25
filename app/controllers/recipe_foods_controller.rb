class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    render 'edit'
  end

  def create
    @recipe = Recipe.find(params[recipe_id])
    @recipe_foods = @recipe.recipe_foods.create(recipe_foods_params)
    if @recipe_foods.save
      flash[:notice] = 'Recipe food is added!'
    else
      'Recipe foods failed to add!'
    end
    redirect_to @recipe
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    flash[:notice] = if @recipe_food.update(params.require(:recipe_food).permit(:food_id, :quantity))
                       'Food updated successfully!'
                     else
                       'Food was not updated!'
                     end
    redirect_to user_recipe_path(id: @recipe_food.recipe_id)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:notice] = 'Recipe food has been removed from recipe!'
    redirect_to @recipe
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
