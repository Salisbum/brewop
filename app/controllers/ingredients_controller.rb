class IngredientsController < ApplicationController
  before_action :authorize_user

  def new
    authorize_user
    recipe
    @ingredient = Ingredient.new
    @units = Ingredient::UNITS
    @ingredients = @recipe.ingredients
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user = current_user
    @ingredient.recipe = recipe

    if @ingredient.save
      flash[:notice] = "Ingredient added."
      redirect_to new_recipe_ingredient_path(@recipe)
    else
      flash[:alert] = "Please ensure you filled out the form correctly. #{@ingredient.errors.full_messages.join ', '}."
      @units = Ingredient::UNITS
      render :new
    end
  end

  def edit
    authorize_user
    ingredient
    @units = Ingredient::UNITS
  end

  def update
    ingredient
    recipe
    if current_user == @recipe.user || current_user.admin?
      if @ingredient.update(ingredient_params)
        flash[:notice] = "Ingredient updated!"
        redirect_to recipe_ingredient_path(@recipe, @ingredient)
      else
        flash[:alert] = "Please ensure you filled out the form correctly. #{@ingredient.errors.full_messages.join ', '}."
        @units = Ingredient::UNITS
        render :edit
      end
    end
  end

  def destroy
    authorize_user
    ingredient

    if current_user == @ingredient.user || current_user.admin?
      if @ingredient.destroy
        flash[:notice] = "Ingredient deleted."
      end
    else
      flash[:notice] = "You cannot delete this ingredient."
    end

    if current_user.admin?
      redirect_to "/admin/dashboard"
    else
      redirect_to recipe_path(recipe)
    end
  end

  def show
    authorize_user
    ingredient
  end

  private

  def recipe
    @recipe ||= Recipe.find(params[:recipe_id])
  end

  def ingredient
    @ingredient ||= Ingredient.find(params[:id])
  end

  def authorize_user
    recipe
    unless current_user.admin? || current_user == @recipe.user
      redirect_to root_path
    end
  end

  def ingredient_params
    params.require(:ingredient).permit(:unit, :quantity, :item)
  end
end
