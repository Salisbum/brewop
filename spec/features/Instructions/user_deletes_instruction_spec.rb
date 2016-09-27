require "rails_helper"

=begin
As an User
I want to be able to delete an instruction
So that I can correct my mistakes
=end

feature "User deletes Instruction" do
  scenario "User deletes Instruction" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)
    instruction = FactoryGirl.create(:instruction, user: user, recipe: recipe, ingredient: ingredient)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    visit recipe_instruction_path(instruction.recipe.id, instruction.id)

    click_on "Delete"

    expect(page).to have_content "Instruction deleted."
  end
end
