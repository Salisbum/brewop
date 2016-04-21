require 'rails_helper'

feature "new user views to their profile page" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  scenario "new user sees personal information" do
    login(user)

    click_link "Account"

    expect(page).to have_content user.email
    expect(page).to have_content profile.username
    expect(page).to have_content profile.brewop_name
    expect(page).to have_content profile.location
    page.should have_selector ("img[src$='#{profile.avatar_url}']")
  end
end
