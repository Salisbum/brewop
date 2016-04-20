require "rails_helper"

=begin
As a user
I want to edit a recipe
So that I can correct any mistakes or add updates

Acceptance Criteria
- I must provide valid information
- I must be presented with errors if I fill out the form incorrectly
- I must be able to get to the edit page from the recipe's details page
=end

feature "authenticated user edits recipe details" do
  scenario "authenticated user correctly edits recipe details" do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    login(user)

    click_link "Recipes"
    click_link recipe.name

    expect(page).to have_content recipe.name

    click_on "Edit"

    fill_in "Name", with: "Super Hefe"
    select "Hefeweizen", from: "Beer Type"
    fill_in "Ingredients", with: "Orange Peel, Coriander"
    fill_in "Brewing Instructions", with: "Add Orange peel and Coriander to muslin bag in wort."
    click_on "Save"

    expect(page).to have_content "Super Hefe"
  end

  scenario "authenticated user incorrectly edits recipe details" do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    login(user)

    click_link "Recipes"
    click_link recipe.name

    expect(page).to have_content recipe.name

    click_on "Edit"

    fill_in "Name", with: ""
    click_on "Save"

    expect(page).to have_content "Please ensure you filled out the form correctly."
  end
end
