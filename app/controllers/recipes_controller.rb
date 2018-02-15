class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end 

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cooktime, :ingredients_id => [])
  end

end
