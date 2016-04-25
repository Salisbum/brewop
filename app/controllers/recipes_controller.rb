class RecipesController < ApplicationController
  before_action :authorize_user, only: [:edit, :show]

  def index
    @recipes = current_user.recipes.order(:name)
    @admin_recipes = Recipe.all.order(:name)
  end

  def new
    @recipe = Recipe.new
    @beer_type_collection = Recipe::BEER_TYPES
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      flash[:notice] = "Recipe added successfully!"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Please ensure you filled out the form correctly. #{@recipe.errors.full_messages.join ', '}."
      @beer_type_collection = Recipe::BEER_TYPES
      render :new
    end
  end

  def show
    authorize_user
    @comment = Comment.new
    @comments = @recipe.comments.order("created_at DESC")
    @ingredients = @recipe.ingredients.order(item: :asc)
    @instructions = @recipe.instructions.order(add_point: :desc)
  end

  def edit
    authorize_user
    @beer_type_collection = Recipe::BEER_TYPES
  end

  def update
    recipe
    if current_user == @recipe.user || current_user.admin?
      if @recipe.update(recipe_params)
        flash[:notice] = "Recipe updated!"
        redirect_to recipe_path(@recipe)
      else
        flash[:alert] = "Please ensure you filled out the form correctly. #{@recipe.errors.full_messages.join ', '}."
        @beer_type_collection = Recipe::BEER_TYPES
        render :edit
      end
    end
  end

  def destroy
    authorize_user
    comments = recipe.comments
    if @recipe.destroy
      comments.each { |comment| comment.destroy }
      flash[:notice] = "Recipe deleted successfully"
    end

    if current_user.admin?
      redirect_to "/admin/dashboard"
    else
      redirect_to recipes_path
    end
  end

  private

  def authorize_user
    recipe
    unless current_user.admin? || current_user == @recipe.user
      redirect_to root_path
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :beer_type)
  end

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end

end
