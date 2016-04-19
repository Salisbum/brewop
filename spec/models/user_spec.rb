require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be an User object" do
    user = FactoryGirl.create(:user)

    expect(user).to be_a User
  end
end
