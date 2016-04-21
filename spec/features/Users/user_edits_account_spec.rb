require "rails_helper"

feature "User edits account" do

  scenario "user navigates to edit account page" do
    default_login

    click_on "Account"

    click_on "Edit Account Information"

    expect(page).to have_content("Cancel my account")
  end
  scenario "user edits account with correct data" do
    default_login

    click_on "Account"

    click_on "Edit Account Information"

    fill_in "Password", with: "11111111"
    fill_in "Password confirmation", with: "11111111"
    fill_in "Current password", with: "12345678"
    click_on "Update"

    expect(page).to have_content("Logout")
  end
  scenario "user edits account with bad data" do
    default_login

    click_on "Account"

    click_on "Edit Account Information"

    fill_in "Password", with: "11111111"
    fill_in "Password confirmation", with: "11"
    fill_in "Current password", with: "12345678"
    click_on "Update"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
