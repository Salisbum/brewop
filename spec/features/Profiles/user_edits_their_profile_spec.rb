require 'rails_helper'

feature "user edits their profile" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  scenario "successfully edits profile" do

    login(user)

    click_link "Account"

    click_link "Edit Profile"

    expect(page).to have_content("Edit Profile")

    fill_in "Username", with: "BillyBob"
    fill_in "Location", with: "France"
    fill_in "Brewop Name", with: "Puntilly Brews"
    attach_file "Avatar url", "#{Rails.root}/spec/support/images/photo.jpg"

    click_button "Update Profile"

    expect(page).to have_content "BillyBob"
    expect(page).to have_content "France"
    expect(page).to have_content "Puntilly Brews"
    expect(page).to have_css("img[src*='photo.jpg']")
    expect(page).to have_content "Successfully edited your Profile!"
  end

  scenario "unsuccessfully edits profile because file size too big" do

    login(user)

    click_link "Account"

    click_link "Edit Profile"

    expect(page).to have_content "Edit Profile"

    fill_in "Username", with: "BillyBob"
    fill_in "Location", with: "France"
    fill_in "Brewop Name", with: "Puntilly Brews"
    attach_file "Avatar url", "#{Rails.root}/spec/support/images/person.jpg"

    click_button "Update Profile"

    expect(page).to have_content "should be less than 500KB"
  end

  scenario "attempts to use a taken username" do
    login(user)

    user2 = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user2)

    click_link "Account"

    click_link "Edit Profile"

    expect(page).to have_content "Edit Profile"

    fill_in "Username", with: user2.profile.username

    click_button "Update Profile"

    expect(page).to have_content "Did not manage to update profile. Username has already been taken."
  end
end
