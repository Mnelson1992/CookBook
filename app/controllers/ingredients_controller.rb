class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = @recipe.ingredients.alphabetical

  end

  def show
  #  @ingredient = @recipe.ingredients
  #  @recipes = @recipe.imngredients.where('user' = ?, current_user.id == @recipe.user_id)
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
    @ingredient.delete
    redirect_to recipe_ingredients_path(@recipe, @ingredients)
  end


  private
  def ingredients_params
    params.require(:ingredient).permit(:name, :quantity, :recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
