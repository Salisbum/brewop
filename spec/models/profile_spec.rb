require 'rails_helper'

RSpec.describe Profile, type: :model do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  describe ".new" do
    it "should be an Profile object" do
      expect(profile).to be_a(Profile)
    end
  end
end
