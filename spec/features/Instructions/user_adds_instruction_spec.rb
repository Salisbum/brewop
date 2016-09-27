require "rails_helper"

=begin
As an User
I want to be able to add intructions to a recipe
So that I know what to add when in the brewing process
=end

feature "User adds new Instruction" do
  scenario "User correctly adds new Instruction" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "New Boil Addition"

    select "OZ", from: "Unit"
    fill_in "Quantity", with: 4
    fill_in "Time Into Boil", with: 40
    fill_in "Temperature", with: "120"
    fill_in "Details", with: "Tasty"

    click_on "Save"

    expect(page).to have_content ingredient.item
    expect(page).to have_content "OZ"
  end

  scenario "User incorrectly adds new Instruction" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "New Boil Addition"

    select "OZ", from: "Unit"
    fill_in "Time Into Boil", with: 40
    fill_in "Temperature", with: "120"
    fill_in "Details", with: "Tasty"

    click_on "Save"

    expect(page).to have_content "Please ensure you filled out the form correctly. Quantity can't be blank."
  end
end
