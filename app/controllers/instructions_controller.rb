class InstructionsController < ApplicationController
  before_action :authorize_user

  def new
    authorize_user
    recipe
    @instruction = Instruction.new
    @ingredients = @recipe.ingredients
    @units = Ingredient::UNITS

    @instructions = @recipe.instructions
  end

  def create
    @instruction = Instruction.new(instruction_params)
    @instruction.user = current_user
    @instruction.recipe = recipe
    @instruction.ingredient = Ingredient.find(params[:ingr_id]["0"])

    if @instruction.save
      flash[:notice] = "Instruction added."
      @units = Ingredient::UNITS
      @ingredients = @recipe.ingredients
      redirect_to new_recipe_instruction_path(@recipe)
    else
      flash[:alert] = "Please ensure you filled out the form correctly. #{@instruction.errors.full_messages.join ', '}."
      @ingredients = @recipe.ingredients
      @units = Ingredient::UNITS
      render :new
    end

  end

  def edit
    authorize_user
    instruction
    @units = Ingredient::UNITS
    @ingredients = @recipe.ingredients
  end

  def update
    instruction
    recipe
    if current_user == @recipe.user || current_user.admin?
      if @instruction.update(instruction_params)
        flash[:notice] = "Instruction updated!"
        redirect_to recipe_instruction_path(@recipe, @instruction)
      else
        flash[:alert] = "Please ensure you filled out the form correctly. #{@instruction.errors.full_messages.join ', '}."
        @units = Ingredient::UNITS
        render :edit
      end
    end

  end

  def destroy
    authorize_user
    instruction

    if current_user == @instruction.user || current_user.admin?
      if @instruction.destroy
        flash[:notice] = "Instruction deleted."
      end
    else
      flash[:notice] = "You cannot delete this Instruction."
    end

    if current_user.admin?
      redirect_to "/admin/dashboard"
    else
      redirect_to recipe_path(recipe)
    end
  end

  def show
    authorize_user
    instruction
  end

  private

  def recipe
    @recipe ||= Recipe.find(params[:recipe_id])
  end

  def instruction
    @instruction ||= Instruction.find(params[:id])
  end

  def authorize_user
    recipe
    unless current_user.admin? || current_user == @recipe.user
      redirect_to root_path
    end
  end

  def instruction_params
    params.require(:instruction).permit(:unit, :quantity, :add_point, :temperature, :details)
  end
end
