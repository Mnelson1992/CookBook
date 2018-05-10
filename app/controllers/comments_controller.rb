class CommentsController < ApplicationController

 def create
   recipe = Recipe.find(params[:recipe_id])
   user = current_user
   comment = recipe.comments.create(comment_params)
   user.comments << comment
   render json: @comment, status: 200
 end

 def index
   recipe = Recipe.find(params[:recipe_id])
   comments = recipe.comments.order(created_at: :asc)
   render json: comments, status: 200
 end

 private

 def comment_params
   params.require(:comment).permit(:body)
 end


end
