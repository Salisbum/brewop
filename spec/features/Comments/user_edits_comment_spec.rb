require "rails_helper"

=begin
As a user
I want to edit a comment
So that I can correct any mistakes or add updates

Acceptance Criteria
- I must provide valid information
- I must be presented with errors if I fill out the form incorrectly
- I must be able to get to the edit form for the comment from the recipe's details page
=end

feature "User edits a comment on a recipe" do
  scenario "User correctly edits a comment on a recipe" do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)
    comment = FactoryGirl.create(:comment, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    expect(page).to have_content comment.body

    click_link "Edit Comment"

    fill_in "Comment", with: "This was terrible."
    click_on "Submit Comment"

    expect(page).to have_content "This was terrible."
  end

  scenario "User incorrectly edits a comment on a recipe" do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)
    comment = FactoryGirl.create(:comment, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    expect(page).to have_content comment.body

    click_link "Edit Comment"

    fill_in "Comment", with: ""
    click_on "Submit Comment"

    expect(page).to have_content "Body can't be blank."
  end
end