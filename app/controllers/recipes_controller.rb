class RecipesController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe = Recipe.new
    8.times do
      ingredient = @recipe.ingredients.build
    end
  end

  def index
    @recipes = current_user.recipes.alphabetical
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
        if @recipe.save
          redirect_to recipe_path(@recipe)
        else
          render :new
        end
  end

  def show
      @recipe = Recipe.find(params[:id])
      @ingredients = @recipe.ingredients.alphabetical
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update

    @recipe = Recipe.find(params[:id])
      if @recipe.update(recipe_params)
        redirect_to @recipe
      else
        render :edit
      end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect_to recipes_path
  end
  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cooktime, :ingredient_ids => [], ingredients_attributes: [:recipe_id, :name])
  end

end
