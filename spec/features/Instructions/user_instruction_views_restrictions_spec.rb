require "rails_helper"

=begin
As an User
I want my recipe instructions to be private
So that I know my account is secure
=end

feature "Visitor/user attempts to view restricted Instruction pages" do
  scenario "Visitor attempts to view Instruction index page" do
  	visit root_path

    visit "/recipes/1/instructions"

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "User attempts to view Instruction index page" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:profile, user: user)
    recipe = FactoryGirl.create(:recipe, user: user)
    ingredient = FactoryGirl.create(:ingredient, user: user, recipe: recipe)

    login(user)

    visit "/recipes/#{recipe.id}/instructions"

    expect(page).to have_content recipe.name
  end
end
