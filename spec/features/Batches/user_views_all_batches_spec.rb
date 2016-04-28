require "rails_helper"

=begin
As a user
I want to be able to see all of the batches I've brewed
So that I can track my beer inventory and brewing history
=end

feature "User views all batches" do
  scenario "User views batches index" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    batch = FactoryGirl.create(:batch, user: user, recipe: recipe)
    batch2 = FactoryGirl.create(:batch, user: user, recipe: recipe)

    login(user)

    click_link "Inventory"

    expect(page).to have_content batch.batch_name
    expect(batch2.batch_name).to appear_before batch.batch_name
  end
end
