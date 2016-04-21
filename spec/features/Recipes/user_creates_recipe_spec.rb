require "rails_helper"

=begin
As a user
I want to add a recipe
So that I can remember what I have brewed and want to brew

Acceptance Criteria
- I must provide the recipe's name
- I must provide the recipe's beer type
- I must provide the recipe's ingredients
- I must provide the recipe's brewing instructions
- I must be presented with errors if I fill out the form incorrectly
=end

feature "authenticated user adds new recipe" do
  scenario "authenticated user correctly adds new recipe" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)

    login(user)

    click_link "Recipes"

    click_link "Add New Recipe"

    fill_in "Recipe Name", with: "Super Hefe"
    fill_in "Description", with: "Tasty fruity hefe."
    fill_in "Ingredients", with: "Orange Peel, Coriander"
    fill_in "Brewing Instructions", with: "Add Orange peel and Coriander to muslin bag in wort."
    select "Hefeweizen", from: "Beer Type"
    click_on "Save"

    expect(page).to have_content "Super Hefe"
  end

  scenario "authenticated user incorrectly adds new recipe" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)

    login(user)

    click_link "Recipes"

    click_link "Add New Recipe"

    fill_in "Name", with: ""
    select "Hefeweizen", from: "Beer Type"
    fill_in "Ingredients", with: ""
    fill_in "Brewing Instructions", with: "Add Orange peel and Coriander to muslin bag in wort."
    click_on "Save"

    expect(page).to have_content "Please ensure you filled out the form correctly."
  end
end
