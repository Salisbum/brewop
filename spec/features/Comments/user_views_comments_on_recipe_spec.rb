require "rails_helper"

=begin
As a user
I want to view the notes for a recipe
So that I can see what I thought of the recipe

Acceptance Criteria:
- I must be on the recipe detail page
- I must only see notes to the recipe I'm viewing
- I must only see notes to the recipe I'm viewing
- I must see all notes listed in order, most recent first
=end

feature "User views all notes on a recipe" do
  scenario "User views all notes on a recipe" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    note = FactoryGirl.create(:comment, user: user, recipe: recipe)
    note2 = FactoryGirl.create(:comment, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    expect(note2.body).to appear_before note.body
  end
end
