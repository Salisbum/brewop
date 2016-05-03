require "rails_helper"

=begin
As an user
I want to be able to add ingredients to Recipes
so that I know what I need to purchase and how much
=end

feature "User adds Ingredient to Recipe" do
  scenario "User correctly adds ingredient to previously created recipe" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "New Ingredient"

    fill_in "Item", with: "Cascade Hops"
    select "PACKAGE(S)", from: "Unit"
    fill_in "Quantity", with: 4

    click_on "Save"

    expect(page).to have_content "Cascade Hops"

    click_on "Back To: " + recipe.name

    expect(page).to have_content "Cascade Hops"
  end

  scenario "User incorrectly adds ingredient to previously created recipe" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "New Ingredient"

    fill_in "Item", with: ""
    select "PACKAGE(S)", from: "Unit"
    fill_in "Quantity", with: 4

    click_on "Save"

    expect(page).to have_content "Please ensure you filled out the form correctly. Item can't be blank."
  end

  scenario "User correctly adds ingredient to new recipe" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)

    login(user)

    click_link "Recipes"

    click_on "Add New Recipe"

    fill_in "Recipe Name", with: "Super Hefe"
    fill_in "Description", with: "Tasty fruity hefe."
    select "Hefeweizen", from: "Beer Type"
    click_on "Save"

    expect(page).to have_content "New Ingredient"

    fill_in "Item", with: "Cascade Hops"
    select "PACKAGE(S)", from: "Unit"
    fill_in "Quantity", with: 4

    click_on "Save"

    expect(page).to have_content "Cascade Hops"

    click_on "Back To: Super Hefe"

    expect(page).to have_content "Cascade Hops"
  end

  scenario "User incorrectly adds ingredient to new recipe" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)

    login(user)

    click_link "Recipes"

    click_on "Add New Recipe"

    fill_in "Recipe Name", with: "Super Hefe"
    fill_in "Description", with: "Tasty fruity hefe."
    select "Hefeweizen", from: "Beer Type"
    click_on "Save"

    expect(page).to have_content "New Ingredient"

    fill_in "Item", with: ""
    select "PACKAGE(S)", from: "Unit"
    fill_in "Quantity", with: 4

    click_on "Save"

    expect(page).to have_content "Please ensure you filled out the form correctly. Item can't be blank."
  end

end
