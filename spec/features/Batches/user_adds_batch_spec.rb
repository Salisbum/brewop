require "rails_helper"

=begin
As an user
I want to add a new batch
So that I can keep track of the different batches I have brewed of a recipe

Acceptance Criteria
- I must be able to click a button in a recipe to go to a page to add a new batch
- I must be presented with errors if I fill out the form incorrectly
- I must provide the number of bottles brewed
- I must provide the type of bottle used
- I must name the batch
- I must add a batch note
=end

feature "user adds a new batch" do
  scenario "user adds a new batch correctly" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "Brewed!"

    fill_in "Batch Name", with: "Awesome"
    select "2L", from: "Bottling Option"
    fill_in "Bottles Brewed", with: 25
    fill_in "Batch Notes", with: "Needs more time."

    click_on "Save"

    expect(page).to have_current_path(recipe_path(recipe))
  end

  scenario "user adds a new batch incorrectly" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "Brewed!"

    fill_in "Batch Name", with: ""
    select "2L", from: "Bottling Option"
    fill_in "Bottles Brewed", with: 25
    fill_in "Batch Notes", with: "Needs more time."

    click_on "Save"

    expect(page).to have_content "Please ensure you filled out the form correctly."
  end
end
