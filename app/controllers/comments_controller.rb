class CommentsController < ApplicationController
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!


 def create
   @recipe = Recipe.find(params[:recipe_id])
   @user = current_user
   @comment = @recipe.comments.create(comment_params)
   @user.comments << @comment
   respond_to do |format|
     format.html {redirect_to recipe_comments_path}
     format.json {render json: @comment, status: 200}
   end
 end

 def index
   @recipe = Recipe.find(params[:recipe_id])
   @comments = @recipe.comments.order(created_at: :asc)
   respond_to do |format|
     format.html {render :show}
     format.json {render json: @comments, status: 200}
   end
 end

 private

 def comment_params
   params.require(:comment).permit(:body)
 end

end
