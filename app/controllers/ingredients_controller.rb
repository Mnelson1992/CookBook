class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  

  def index
    @ingredients = @recipe.ingredients.alphabetize
    respond_to do |format|
      format.html
      format.json {render json: @ingredients}
    end
  end

  def show
  end

  def new
    @ingredient = @recipe.ingredients.new
  end

  def create
    @ingredient = @recipe.ingredients.create(ingredients_params)
    if @ingredient.save
      redirect_to recipe_ingredients_path(@recipe, @ingredients)
    else
      render :new
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to recipe_ingredients_path(@recipe, @ingredients)
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name, :recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
