# require "rails_helper"
#
# =begin
# As a user
# I want to note on a recipe
# So that I can remember what I thought of it and how it went
#
# Acceptance Criteria
# - I must be on the recipe detail page
# - I must provide a description
# - I must be presented with errors if I fill out the form incorrectly
# =end
#
# feature "User creates a note on a recipe" do
#   scenario "User correctly creates a new note on a recipe", js: true, focus: true do
#
#     user = FactoryGirl.create(:user)
#     FactoryGirl.create(:profile, user: user)
#     recipe = FactoryGirl.create(:recipe, user: user)
#
#     login(user)
#
#     click_link "Recipes"
#
#     click_link recipe.name
#
#     find(".new-comment").trigger("click")
#
#     fill_in "comment[body]", with: 'Turned out well, could have bottled earlier.'
#     click_on "Submit Note"
#     # binding.pry
# #
#     # find("#newest-comment")
#     sleep(5)
#
#     expect(page).to have_content "Turned out well, could have bottled earlier."
#   end
#
#   scenario "User incorrectly creates a new note on a recipe", js: true do
#     pending
#
#     user = FactoryGirl.create(:user)
#     FactoryGirl.create(:profile, user: user)
#
#     recipe = FactoryGirl.create(:recipe, user: user)
#
#     login(user)
#
#     click_link "Recipes"
#
#     click_link recipe.name
#
#     find(".new").trigger("click")
#
#     click_on "Submit Note"
#
#     expect(page).to have_content "Body can't be blank."
#   end
# end
