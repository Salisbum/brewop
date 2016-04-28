class BatchesController < ApplicationController
  before_action :authorize_user

  def index
    if recipe.nil?
      @all_batches = current_user.batches.order("created_at DESC")
    else
      @recipe_batches = recipe.batches.order("created_at DESC")
    end
  end

  def new
    authorize_user
    recipe
    @batch = Batch.new
    @bottle_options = Batch::BOTTLING_OPTIONS
  end

  def create
    @batch = Batch.new(batch_params)
    @batch.user = current_user
    @batch.recipe = recipe
    @batch.bottle_count = @batch.bottle_brewed

    if @batch.save
      flash[:notice] = "Batch added."
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Please ensure you filled out the form correctly. #{@batch.errors.full_messages.join ', '}."
      @bottle_options = Batch::BOTTLING_OPTIONS
      render :new
    end
  end

  def edit
    authorize_user
    batch
    @bottle_options = Batch::BOTTLING_OPTIONS
  end

  def update
    batch
    recipe
    if current_user == @recipe.user || current_user.admin?
      if @batch.update(batch_params)
        flash[:notice] = "Batch updated!"
        redirect_to recipe_batch_path(@recipe, @batch)
      else
        flash[:alert] = "Please ensure you filled out the form correctly. #{@batch.errors.full_messages.join ', '}."
        @bottle_options = Batch::BOTTLING_OPTIONS
        render :edit
      end
    end
  end

  def destroy
    authorize_user
    batch

    if current_user == @batch.user || current_user.admin?
      if @batch.destroy
        flash[:notice] = "Batch deleted."
      end
    else
      flash[:notice] = "You cannot delete this batch."
    end

    if current_user.admin?
      redirect_to "/admin/dashboard"
    else
      redirect_to recipe_path(recipe)
    end
  end

  def show
    authorize_user
    batch
  end

  private

  def recipe
    unless params[:recipe_id].nil?
      @recipe ||= Recipe.find(params[:recipe_id])
    end
  end

  def batch
    @batch ||= Batch.find(params[:id])
  end

  def authorize_user
    unless recipe.nil?
      unless current_user.admin? || current_user == @recipe.user
        redirect_to root_path
      end
    else
      unless current_user.admin? || user_signed_in?
        redirect_to root_path
      end
    end
  end

  def batch_params
    params.require(:batch).permit(:bottling_option, :bottle_brewed, :batch_notes, :batch_name)
  end
end
