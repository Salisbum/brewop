require 'rails_helper'

feature "Users should not see Admin pages" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:profile1) { FactoryGirl.create(:profile, user: user1) }
  let!(:recipe) { FactoryGirl.create(:recipe, user: user1) }
  let(:comment) { FactoryGirl.create(:comment, user: user1, recipe: recipe) }

  scenario "User attempts to view users path" do
    login(user1)

    visit "/admin/users"

    expect(page).to_not have_content user1.email
    expect(page.current_path).to eq root_path
  end

  scenario "User attempts to view all recipes path" do
    login(user1)

    visit "/admin/recipes"

    expect(page).to_not have_content recipe.name
    expect(page.current_path).to eq root_path
  end

  scenario "User attempts to view all comments path" do
    login(user1)

    visit "/admin/comments"

    expect(page).to_not have_content comment.body
    expect(page.current_path).to eq root_path
  end

  scenario "User attempts to view admin Dashboard path" do
    login(user1)

    visit "/admin/dashboard"

    expect(page).to_not have_content "Number of Users"
    expect(page.current_path).to eq root_path
  end

  scenario "User attempts to view profiles path" do
    login(user1)

    visit "/profiles"

    expect(page).to_not have_content user1.email
    expect(page.current_path).to eq root_path
  end
end
