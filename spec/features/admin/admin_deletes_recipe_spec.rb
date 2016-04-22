require 'rails_helper'
feature "Admin deletes a recipe" do
  let!(:user1) { FactoryGirl.create(:user) }

  scenario 'Admin sucessfully deletes a recipe and associated comments' do
    profile = FactoryGirl.create(:profile, user: user1)
    recipe = FactoryGirl.create(:recipe, user: user1)
    comment = FactoryGirl.create(:comment, user: user1, recipe: recipe)

    admin_login

    click_link "Admin Dashboard"

    click_link "All Recipes"

    expect(page).to have_content recipe.name

    click_on recipe.name

    click_button "Delete"

    expect(page).to have_content "Recipe deleted successfully"
    expect(page).to_not have_content recipe.name
  end
end
