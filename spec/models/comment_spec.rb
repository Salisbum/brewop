require "rails_helper"

RSpec.describe Comment, type: :model do
  it "should be an Comment object" do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)
    comment = FactoryGirl.create(:comment, user: user, recipe: recipe)

    expect(comment).to be_a Comment
  end
end
