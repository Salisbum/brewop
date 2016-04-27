def default_login
  user = FactoryGirl.create(:user)
  FactoryGirl.create(:profile, user: user)

  visit root_url

  click_link "Login"

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end

def login(user)
  visit root_url

  visit "/users/sign_in"
  
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end

def admin_login
  user = FactoryGirl.create(:user, role: "admin")
  FactoryGirl.create(:profile, user: user)

  visit root_url

  click_link "Login"

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end
