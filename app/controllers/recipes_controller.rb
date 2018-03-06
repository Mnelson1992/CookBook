class RecipesController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe = Recipe.new
    8.times {ingredient = @recipe.ingredients.build}
    8.times {@recipe.recipe_ingredients.build}
  end

  def index
    @recipes = current_user.recipes.alphabetize
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.user = current_user
      if @recipe.save
        redirect_to recipe_path(@recipe)
      else
        render :new
      end
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.alphabetize
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.user = current_user
      if @recipe.update(recipe_params)
        redirect_to @recipe
      else
        render :edit
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cooktime, :ingredient_ids => [], ingredients_attributes: [:recipe_id, :quantity, :name])
  end

end
