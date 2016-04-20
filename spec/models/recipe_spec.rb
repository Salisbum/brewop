require "rails_helper"

RSpec.describe Recipe, type: :model do
  it "should be a Recipe object" do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    expect(recipe).to be_a Recipe
  end
end
