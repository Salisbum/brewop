require "rails_helper"

=begin
As an user
I want to be able to delete a batch
So that I can remove duplicates or old recipes

Acceptance Criteria:
- I must be able to delete a batch from the batch show page
=end

feature "User deletes a batch" do
  scenario "User deletes a batch" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    batch = FactoryGirl.create(:batch, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "Batches"

    click_on batch.batch_name

    click_on "Delete"

    expect(page).to have_content "Batch deleted."
  end
end
