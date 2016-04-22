require "rails_helper"

=begin
As a user
I want to delete a note
So that I can delete duplicate notes

Acceptance Criteria
- I must be able delete a note from the note details page
=end

feature "User deletes a note" do
  scenario "User deletes a note" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    note = FactoryGirl.create(:comment, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    expect(page).to have_content note.body
    click_on "Delete Note"
    
    expect(page).to have_content "No notes yet!"
  end
end
