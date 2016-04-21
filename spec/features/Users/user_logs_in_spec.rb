require "rails_helper"

feature "User logs in" do

  scenario "user navigates to log in page" do
    visit root_path

    expect(page).to have_content("Login")
  end
  scenario "user successfully logs in" do
    default_login

    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("BrewOp")
  end
  scenario "user unsuccessfully logs in" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    
    visit root_path

    click_link "Login"

    fill_in "Email", with: user.email
    fill_in "Password", with: "wrongpassword"

    click_on "Log in"

    expect(page).to have_content("Invalid email or password.")
  end
end
