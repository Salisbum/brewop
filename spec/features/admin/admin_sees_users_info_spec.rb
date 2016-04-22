require 'rails_helper'
=begin
As an admin
I want to see user info
So that I can keep track of the user base

Acceptance Criteria
- I must be logged in as a registered admin
- I must be able to see the user info for any user
- I must be able to see their email
- I must be able to see a list of recipes associated with that user
=end

feature "Admin sees user data" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario "Admin visits user's show page sucessfully" do
    profile1 = FactoryGirl.create(:profile, user: user1)
    FactoryGirl.create(:profile, user: user2)

    admin_login

    click_link "Admin Dashboard"

    click_link "User List"

    expect(page).to have_content user1.email

    click_link user1.email

    expect(page).to have_content profile1.username
  end
end
