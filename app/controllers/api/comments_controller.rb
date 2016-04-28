class Api::CommentsController < ApplicationController
  respond_to :json, :js

  def index
    recipe
    @comments = @recipe.comments.order("created_at DESC")
    render json: { comments: @comments }
  end

  def show
    @comment = Comment.find(params[:id])
    render json: { comments: @comments }
  end

  def edit
    authorize_user
    @comment = Comment.find(params[:id])
  end

  def create
    authorize_user
    @comment = Comment.new(comment_params)
    @comment.recipe = recipe
    @comment.user = current_user

    if @comment.save
      # flash[:notice] = "Note saved!"
      render json: { comment: @comment, status: :created }
    else
      render json: { errors: @comment.errors, status: :unprocessable_entity }
      # flash[:alert] = "Note not saved! #{@comment.errors.full_messages.join ', '}."
    end
  end

  def update
    authorize_user
    @comment = Comment.find(params[:id])

    if current_user == @comment.user || current_user.admin?
      if @comment.update(comment_params)
        render json: nil, status: :ok
      else
        render json: @comment.errors,
          status: :unprocessable_entity
      end
    end
  end

  def destroy
    authorize_user

    @comment = Comment.find(params[:id])
    if current_user == @comment.user || current_user.admin?
      @comment.destroy
        render json: { status: :ok }
    else
      render json: @comment.errors,
        status: :unprocessable_entity
    end
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
