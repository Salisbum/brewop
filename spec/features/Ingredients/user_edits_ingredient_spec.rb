require "rails_helper"

=begin
As an User
I want to be able to edit an Ingredient
So that I can modify it or correct mistakes
=end

feature "User edits an Ingredient" do
  scenario "User correctly edits Ingredient" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_link ingredient.item

    click_on "Edit"

    fill_in "Item", with: "Super Awesome Malt"

    click_on "Save"

    expect(page).to have_content "Ingredient updated!"
    expect(page).to have_content "Super Awesome Malt"
  end

  scenario "User incorrectly edits Ingredient" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_link ingredient.item

    click_on "Edit"

    fill_in "Item", with: ""

    click_on "Save"

    expect(page).to have_content "Please ensure you filled out the form correctly. Item can't be blank."
  end
end
