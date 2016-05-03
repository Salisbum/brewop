require "rails_helper"

=begin
As an User
I want my recipe ingredients to be private
So that I know my account is secure
=end

feature "Visitor/user attempts to view restricted Ingredient pages" do
  scenario "Visitor attempts to view Ingredient index page" do
  	visit root_path

    visit "/recipes/1/ingredients"

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "User attempts to view Ingredient index page" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)

    login(user)

    visit "/recipes/#{recipe.id}/ingredients"

    expect(page).to have_content recipe.name
  end
end
