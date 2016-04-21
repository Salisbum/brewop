require "rails_helper"

=begin
As a user
I want to view all recipes
So that I can decide which to brew

Acceptance Criteria
- I must only be able to see recipes when I am logged in
- I must see the name of each recipe
- I must see recipes listed alphabetically
- I must only see my own recipes
=end

feature "authenticated user views all recipes" do
  scenario "unauthenticated user cannot view recipes" do
    visit root_path

    expect(page).to_not have_content "Recipes"
  end

  scenario "authenticated user can view all of their recipes in alphabetical order" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    recipe2 = FactoryGirl.create(:recipe, user: user)
    recipe3 = FactoryGirl.create(:recipe, user: user)

    login(user)

    expect(page).to have_content "Recipes"
    click_link "Recipes"

    expect(page).to have_content recipe.name
    expect(recipe2.name).to appear_before recipe3.name
  end

  scenario "authenticated user cannot view other users' recipes" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    recipe2 = FactoryGirl.create(:recipe, user: user)
    recipe3 = FactoryGirl.create(:recipe, user: user)

    default_login

    click_link "Recipes"

    expect(page).to_not have_content recipe.name
    expect(page).to_not have_content recipe2.name
    expect(page).to_not have_content recipe3.name
  end
end
