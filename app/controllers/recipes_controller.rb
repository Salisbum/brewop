class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.order(:name)
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
    recipe
    @comment = Comment.new
    @comments = @recipe.comments.order("created_at DESC")
  end

  def edit
    recipe
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
    recipe
    if current_user == @recipe.user || current_user.admin?
      if @recipe.destroy
        flash[:notice] = "Recipe deleted successfully"
      end
      redirect_to recipes_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :brewing_instructions, :description, :beer_type)
  end

  def recipe
  @recipe ||= Recipe.find(params[:id])
  end

end
