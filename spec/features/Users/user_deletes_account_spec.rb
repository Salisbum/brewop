require "rails_helper"

feature "User deletes account" do

  scenario "user navigates to edit account page" do
    default_login

    click_on "Account"

    click_on "Edit Account Information"

    expect(page).to have_content("Cancel my account")
  end

  scenario "user deletes their own account" do
    default_login

    click_on "Account"
    
    click_on "Edit Account Information"

    click_on "Cancel my account"

    expect(page).to have_content("Bye! Your account has been successfully cancelled.")
  end

  scenario "user attempts to log in with deleted account" do
    default_login

    click_on "Account"

    click_on "Edit Account Information"

    click_on "Cancel my account"

    click_on "Login"

    fill_in "Email", with: "herpderp@gmail.com"
    fill_in "Password", with: "12345678"
    click_on "Log in"

    expect(page).to have_content("Log in")
  end
end
