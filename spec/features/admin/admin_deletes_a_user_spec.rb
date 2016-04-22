require 'rails_helper'

feature "Admin visits users index" do
  let!(:user1) { FactoryGirl.create(:user) }

  scenario "Admin deletes user sucessfully" do
    profile = FactoryGirl.create(:profile, user: user1)
    recipe = FactoryGirl.create(:recipe, user: user1)
    comment = FactoryGirl.create(:comment, user: user1, recipe: recipe)

    admin_login

    click_link "Admin Dashboard"

    click_link "User List"

    expect(page).to have_content user1.email

    page.all('.button_to')[0].click_button "Delete"

    expect(page).to_not have_content user1.email
    expect(page).to have_content "Account Deleted Successfully!"

    click_link "All Recipes"

    expect(page).to_not have_content recipe.name
  end
end
