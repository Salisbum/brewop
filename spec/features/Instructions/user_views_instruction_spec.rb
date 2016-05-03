require "rails_helper"

=begin
As an User
I want to see Instructions on the Recipes show page
So that I can quickly know what I need to do to brew the beer
=end

feature "User views instructions for a recipe" do
  scenario "User views Instruction summary for a recipe" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)
    instruction = FactoryGirl.create(:instruction, user: user, recipe: recipe, ingredient: ingredient)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    expect(page).to have_content instruction.quantity
  end
end
