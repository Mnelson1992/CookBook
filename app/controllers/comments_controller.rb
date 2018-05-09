class CommentsController < ApplicationController
 def index
   @recipe = Recipe.find(params[:recipe_id])
   @comments = @recipe.comments.order(created_at: :asc)
   render json: @comments, status: 200
 end

 
end
