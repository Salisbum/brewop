require "rails_helper"

=begin
As a user
I want to delete a recipe
So that I can delete duplicate recipes

Acceptance Criteria
- I must be able delete a recipe from the recipe edit page
- I must be able delete a recipe from the recipe details page
- All comments associated with the recipe must also be deleted
=end

feature "authenticated user deletes recipe" do
  scenario "authenticated user successfully deletes recipe" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    recipe2 = FactoryGirl.create(:recipe, user: user)
    recipe3 = FactoryGirl.create(:recipe, user: user)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "Delete"

    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe3.name
  end
end
