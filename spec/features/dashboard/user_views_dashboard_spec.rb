require "rails_helper"

=begin
As an user
I want to be able to view a summary of my activity in BrewOp
So I have a better idea of what I've done

Acceptance Criteria:
- Must be able to see personal dashboard after logging in
- Must see activity Feed
- Must see key data visualizations
=end

feature "user views their centralized dashboard" do
  scenario "user navigates and views their dashboard" do
    default_login

    click_link "Dashboard"

    expect(page).to have_content "Homebrewing Summary"
    expect(page).to have_content "Activity"
  end
end
