require "rails_helper"

=begin
As an User
I want to delete an Ingredient
So that I can remove incorrect or duplicate entries
=end

feature "User deletes Ingredient" do
  scenario "User deletes Ingredient" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_link ingredient.item

    click_on "Delete"

    expect(page).to have_content "Ingredient deleted."
    expect(page).to have_content recipe.name
  end
end
