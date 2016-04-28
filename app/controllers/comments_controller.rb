class CommentsController < ApplicationController
  before_action :authorize_user, only: [:edit]
  respond_to :html, :js, :json

  def create
    @comment = Comment.new(comment_params)
    @comment.recipe = recipe
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Note saved!"
    else
      flash[:alert] = "Note not saved! #{@comment.errors.full_messages.join ', '}."
    end

    redirect_to recipe_path(recipe)
  end

  def destroy
    recipe
    @comment = Comment.find(params[:id])
    if current_user == @comment.user || current_user.admin?
      if @comment.destroy
        flash[:notice] = "Note deleted."
      end
    else
      flash[:notice] = "You cannot delete this note."
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
        flash[:notice] = "Note updated!"
      else
        flash[:alert] = "Note not saved! #{@comment.errors.full_messages.join ', '}."
      end
    else
      flash[:notice] = "You cannot edit this note."
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
