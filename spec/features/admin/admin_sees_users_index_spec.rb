require 'rails_helper'

feature "Admin visits users index" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario "Admin visits users index sucessfully" do
    FactoryGirl.create(:profile, user: user1)
    FactoryGirl.create(:profile, user: user2)

    admin_login

    click_link "Admin Dashboard"

    expect(page).to have_content user1.email
    expect(page).to have_content user2.email
  end
end
