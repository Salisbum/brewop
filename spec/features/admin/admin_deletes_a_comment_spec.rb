require 'rails_helper'

feature "Admin deletes a comment" do
  let!(:user1) { FactoryGirl.create(:user) }

  scenario "Admin deletes a comment sucessfully" do
    profile = FactoryGirl.create(:profile, user: user1)
    recipe = FactoryGirl.create(:recipe, user: user1)
    note = FactoryGirl.create(:comment, user: user1, recipe: recipe)

    admin_login

    click_link "Admin Dashboard"

    click_link "All Recipes"

    click_link recipe.name

    expect(page).to have_content note.body

    click_on "Delete Note"

    expect(page).to_not have_content note.body
  end
end
