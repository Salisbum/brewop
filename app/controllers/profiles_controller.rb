class ProfilesController < ApplicationController
  before_action :authorize_user, only: [:index]

  def index
      redirect_to root_path
  end

  def show
    profile = Profile.find(params[:id])
    user = profile.user
    unless current_user.admin? || current_user == user
      redirect_to root_path
    else
      @profile = Profile.find(params[:id])
      @user = @profile.user
    end
  end

  def destroy
    profile = Profile.find(params[:id])
    user = profile.user
    recipes = user.recipes
    comments = user.comments

    if profile.destroy && user.destroy
      recipes.each { |recipe| recipe.destroy }
      comments.each { |comment| comment.destroy }
      flash[:notice] = "Account Deleted Successfully!"
    else
      flash[:alert] = "Account Not Deleted"
    end

    if current_user.admin?
      redirect_to "/admin/dashboard"
    else
      redirect_to profiles_path
    end
  end

  def edit
    profile = Profile.find(params[:id])
    user = profile.user
    unless current_user == user
      redirect_to root_path
    else
      @profile = Profile.find(params[:id])
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = "Successfully edited your Profile!"
      redirect_to profile_path(@profile)
    else
      flash[:alert] = "Did not manage to update profile. #{@profile.errors.full_messages.join(', ')}."
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :username,
      :location,
      :brewop_name,
      :avatar_url,
      :remove_avatar_url
    )
  end

  def authorize_user
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
