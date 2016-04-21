class AdminsController < ApplicationController
  before_action :authorize_user, only: [:show]

  def show
    render template: "admin/#{params[:page]}"
    @profiles = Profile.all.order("created_at ASC")
    @admin_recipes = Recipe.all.order(:name)
  end

  private

  def authorize_user
    if !current_user.admin?
      redirect_to root_path
    end
  end

end
