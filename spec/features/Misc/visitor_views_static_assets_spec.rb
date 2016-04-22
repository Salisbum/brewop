require "rails_helper"

=begin
As a visitor
I want to be able to visit the static pages of the app
So that I can learn more about BrewOp

Acceptance Criteria
- I must be able to view the Homepage
- I must be able to view the About page
- I must be able to view the Feedback page
- I must be able to view the Newbies page
=end

feature "visitor views static assets" do
  scenario "visitor views the homepage" do
    visit root_path
    expect(page).to have_content "Manage your beer recipes and the brewing process."
  end

  scenario "visitor views the about page" do
    visit root_path

    click_link "About"

    expect(page).to have_content "About"
    expect(page).to have_content "I'm a homebrewer who also happens to be a web developer."
  end

  scenario "visitor views the feedback page" do
    visit root_path

    click_link "Feedback"

    expect(page).to have_content "Want to leave feedback?"
  end

  scenario "visitor views the newbies page" do
    visit root_path

    click_link "Brewbies"

    expect(page).to have_content "New to brewing?"
  end
end
