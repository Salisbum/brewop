require "rails_helper"

=begin
As a user
I want to view the comments for a recipe
So that I can see what I thought of the recipe

Acceptance Criteria:
- I must be on the recipe detail page
- I must only see comments to the recipe I'm viewing
- I must only see comments to the recipe I'm viewing
- I must see all comments listed in order, most recent first
=end

feature "User views all comments on a recipe" do
  scenario "User views all comments on a recipe" do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)
    comment = FactoryGirl.create(:comment, user: user, recipe: recipe)
    comment2 = FactoryGirl.create(:comment, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    expect(comment2.body).to appear_before comment.body
  end
end
