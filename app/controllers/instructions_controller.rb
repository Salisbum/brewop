class InstructionsController < ApplicationController
  before_action :authorize_user, only: [:edit]

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
