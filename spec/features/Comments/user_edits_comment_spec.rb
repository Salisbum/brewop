# require "rails_helper"
#
# =begin
# As a user
# I want to edit a note
# So that I can correct any mistakes or add updates
#
# Acceptance Criteria
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit form for the note from the recipe's details page
# =end
#
# feature "User edits a note on a recipe" do
#   scenario "User correctly edits a note on a recipe", js: true do
#     pending
#
#     user = FactoryGirl.create(:user)
#     FactoryGirl.create(:profile, user: user)
#     recipe = FactoryGirl.create(:recipe, user: user)
#     note = FactoryGirl.create(:comment, user: user, recipe: recipe)
#
#     login(user)
#
#     click_link "Recipes"
#
#     click_link recipe.name
#
#     expect(page).to have_content note.body
#
#     find(".edit").trigger("click")
#
#     fill_in "Note", with: "This was terrible."
#     click_on "Edit Note"
#
#     expect(page).to have_content "This was terrible."
#   end
#
#   scenario "User incorrectly edits a note on a recipe", js: true do
#     pending
#
#     user = FactoryGirl.create(:user)
#     FactoryGirl.create(:profile, user: user)
#     recipe = FactoryGirl.create(:recipe, user: user)
#     note = FactoryGirl.create(:comment, user: user, recipe: recipe)
#
#     login(user)
#
#     click_link "Recipes"
#
#     click_link recipe.name
#
#     expect(page).to have_content note.body
#
#     find(".edit").trigger("click")
#
#     fill_in "Note", with: ""
#     click_on "Edit Note"
#
#     expect(page).to have_content "Body can't be blank."
#   end
# end
