require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be an User object" do
    recipe = FactoryGirl.create(:recipe)

    expect(recipe).to be_a Recipe
  end
end
