require "rails_helper"

=begin
As an User
I want be able to edit an Instruction
So that I can correct any errors
=end

feature "User edits an Instruction" do
  scenario "User correctly edits an Instruction" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)
    instruction = FactoryGirl.create(:instruction, user: user, recipe: recipe, ingredient: ingredient)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    visit recipe_instruction_path(instruction.recipe.id, instruction.id)

    click_on "Edit"

    fill_in "Quantity", with: 4.4

    click_on "Save"

    expect(page).to have_content "4.4"
  end

  scenario "User incorrectly edits an Instruction" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)
    instruction = FactoryGirl.create(:instruction, user: user, recipe: recipe, ingredient: ingredient)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    visit recipe_instruction_path(instruction.recipe.id, instruction.id)

    click_on "Edit"

    fill_in "Quantity", with: ""

    click_on "Save"

    expect(page).to have_content "Please ensure you filled out the form correctly. Quantity can't be blank."
  end
end
