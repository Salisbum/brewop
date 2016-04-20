class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.recipe = recipe
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment saved!"
    else
      flash[:alert] = "Comment not saved! #{@comment.errors.full_messages.join ', '}."
    end
    redirect_to recipe_path(recipe)
  end

  def destroy
    recipe
    @comment = Comment.find(params[:id])
    if current_user == @comment.user || current_user.admin?
      if @comment.destroy
        flash[:notice] = "Comment deleted."
      end
    else
      flash[:notice] = "You cannot delete this comment."
    end
    redirect_to recipe_path(recipe)
  end

  def edit
    recipe
    @comment = Comment.find(params[:id])
  end

  def update
    recipe
    @comment = Comment.find(params[:id])
    if current_user == @comment.user || current_user.admin?
      if @comment.update(comment_params)
        flash[:notice] = "Comment updated!"
      else
        flash[:alert] = "Comment not saved! #{@comment.errors.full_messages.join ', '}."
      end
    else
      flash[:notice] = "You cannot edit this comment."
    end
    redirect_to recipe_path(recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def recipe
    @recipe ||= Recipe.find(params[:recipe_id])
  end
end
