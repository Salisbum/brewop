require "rails_helper"

=begin
As a user
I want to comment on a recipe
So that I can remember what I thought of it and how it went

Acceptance Criteria
- I must be on the recipe detail page
- I must provide a description
- I must be presented with errors if I fill out the form incorrectly
=end

feature "User creates a comment on a recipe" do
  scenario "User correctly creates a new comment on a recipe" do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    fill_in "Comment", with: "Turned out well, could have bottled earlier."
    click_on "Submit Comment"

    expect(page).to have_content "Turned out well, could have bottled earlier."
  end

  scenario "User incorrectly creates a new comment on a recipe" do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "Submit Comment"

    expect(page).to have_content "Body can't be blank."
  end
end