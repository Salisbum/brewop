require "rails_helper"

=begin
As an user
I want to edit a batch
So that I can correct any mistakes

Acceptance Criteria
- I must be presented with errors if I fill in the form incorrectly
- I must be redirected to the batch page upon successfully updating the batch
- I must be presented with a notificated upon successfully updating the batch
=end

feature "User edits batch" do
  scenario "User correctly edits batch" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    batch = FactoryGirl.create(:batch, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "Batches"

    click_on batch.batch_name

    click_on "Edit"

    fill_in "Batch Name", with: "Awesome"
    select "2L", from: "Bottling Option"
    fill_in "Bottles Brewed", with: 25
    fill_in "Batch Notes", with: "Needs more time."

    click_on "Save"
    expect(page).to have_content "Batch updated!"
  end

  scenario "User incorrectly edits batch" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    batch = FactoryGirl.create(:batch, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "Batches"

    click_on batch.batch_name

    click_on "Edit"

    fill_in "Batch Name", with: ""

    click_on "Save"
    expect(page).to have_content "Please ensure you filled out the form correctly. Batch name can't be blank."
  end
end
