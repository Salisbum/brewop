require "rails_helper"

=begin
As a user
I want to view a recipe's details
So that I can see all of its information

Acceptance Criteria
- I must be able to get to this page from the recipe index
- I must see the recipe's name
- I must see the recipe's beer type
- I must see the recipe's ingredients
- I must see the recipe's brewing instructions
=end

feature "authenticated user views recipe details" do
  scenario "authenticated user can view recipe details" do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    login(user)

    click_link "Recipes"
    click_link recipe.name

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.beer_type
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.brewing_instructions
  end
end
