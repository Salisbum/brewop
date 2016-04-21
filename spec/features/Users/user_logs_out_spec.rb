require "rails_helper"

feature "User logs out" do
  scenario "user successfully logs out" do
    default_login

    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")

    click_on "Logout"

    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end
end
