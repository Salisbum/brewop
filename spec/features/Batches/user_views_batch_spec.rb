require "rails_helper"

=begin
As an user
I want to view batch information
So that I can remember the details of the batch

Acceptance Criteria
- I must see the batch name
- I must see the number of bottles brewed
- I must see the type of bottle brewed
- I must see the remaining bottles
- I must see the batch notes
=end

feature "User views batch information" do
  scenario "User views batch information" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    batch = FactoryGirl.create(:batch, user: user, recipe: recipe)

    login(user)

    click_link "Recipes"

    click_link recipe.name

    click_on "Batches"

    click_on batch.batch_name

    expect(page).to have_content batch.batch_name
    expect(page).to have_content batch.batch_notes
    expect(page).to have_content batch.bottle_count
    expect(page).to have_content batch.bottle_brewed
    expect(page).to have_content batch.bottling_option
  end
end
