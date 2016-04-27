class CommentsController < ApplicationController
  before_action :authorize_user, only: [:edit]

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

    if current_user.admin?
      redirect_to "/admin/dashboard"
    else
      redirect_to recipe_path(recipe)
    end
  end

  def edit
    authorize_user
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

  def recipe
    @recipe ||= Recipe.find(params[:recipe_id])
  end

  def authorize_user
    recipe
    unless current_user.admin? || current_user == @recipe.user
      redirect_to root_path
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
