class Api::CommentsController < ApplicationController
  def index
    recipe
    @comments = @recipe.comments.order("created_at DESC")
    render json: { comments: @comments }
  end

  def show
    @comment = Comment.find(params[:id])
    render json: { comments: @comments }
  end

  # def create
  #   @comment = Comment.new(comment_params)
  #   @comment.recipe = recipe
  #   @comment.user = current_user
  #
  #   if @comment.save
  #     render json: { comments: @comments,
  #       status: :created,
  #       location: api_recipe_comment_url(@recipe, @comment)
  #     }
  #   else
  #     render json: @comment.errors,
  #       status: :unprocessable_entity
  #   end
  # end

  # def edit
  #   authorize_user
  #   @comment = Comment.find(params[:id])
  # end
  #
  # def update
  #   authorize_user
  #   @comment = Comment.find(params[:id])
  #   if current_user == @comment.user || current_user.admin?
  #     if @comment.update(comment_params)
  #       render json: nil, status: :ok
  #     else
  #       render json: @comment.errors,
  #         status: :unprocessable_entity
  #     end
  #   end
  # end

  def destroy
    authorize_user
    @comment = Comment.find(params[:id])
    if current_user == @comment.user || current_user.admin?
      @comment.destroy
      render json: nil, status: :ok
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
