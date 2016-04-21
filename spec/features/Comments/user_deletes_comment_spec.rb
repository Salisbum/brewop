require "rails_helper"

=begin
As a user
I want to delete a comment
So that I can delete duplicate comments

Acceptance Criteria
- I must be able delete a comment from the comment details page
=end

feature "User deletes a comment" do
  scenario "User deletes a comment" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    comment = FactoryGirl.create(:comment, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    expect(page).to have_content comment.body
    click_on "Delete Comment"
    expect(page).to have_content "No comments yet!"
  end
end
