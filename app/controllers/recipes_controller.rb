class RecipesController < ApplicationController
  before_action :authenticate_user!


  def new
    @recipe = Recipe.new
    #8.times {ingredient = @recipe.ingredients.build}
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
        render_to :new
      end
    end
    render json: @recipe, status: 201
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.recipe_ingredients
    @comment = @recipe.comments
    @comment = Comment.new
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @recipe, status: 200}
    end
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
    params.require(:recipe).permit(:name, :instructions, :cooktime, recipe_ingredients_attributes: [:recipe_id, :quantity, :name, :id])
  end

end
