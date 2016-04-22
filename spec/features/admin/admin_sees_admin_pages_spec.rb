require 'rails_helper'

feature "Admin should see all admin pages" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:profile1) { FactoryGirl.create(:profile, user: user1) }
  let!(:recipe) { FactoryGirl.create(:recipe, user: user1) }

  scenario "Admin attempts to view users path" do
    admin_login

    visit "/admin/users"

    expect(page).to have_content user1.email
  end

  scenario "Admin attempts to view all recipes path" do
    admin_login

    visit "/admin/recipes"

    expect(page).to have_content recipe.name
  end

  scenario "Admin attempts to view all comments path" do
    comment2 = FactoryGirl.create(:comment)
    admin_login

    visit "/admin/comments"

    expect(page).to have_content comment2.body
  end

  scenario "Admin attempts to view admin Dashboard path" do
    admin_login

    visit "/admin/dashboard"

    expect(page).to have_content "Number of Users"
  end
end
