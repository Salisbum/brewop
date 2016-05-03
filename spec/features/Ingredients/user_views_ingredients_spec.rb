require "rails_helper"

=begin
As an User
I want to see Ingredients on the Recipes show page
So that I can quickly know what I need to brew the beer
=end

feature "User views ingredients for a recipe" do
  scenario "User views ingredient summary for a recipe" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    expect(page).to have_content ingredient.item
  end
end
