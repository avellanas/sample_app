include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit signin_path
    fill_in_signin(user)
  end
end

def fill_in_signin(user, password=user.password)
  fill_in "Email",    with: user.email
  fill_in "Password", with: password
  click_button "Sign in"
end  

def valid_signup
  fill_in "Name",         with: "Example User"
  fill_in "Email",        with: "user@example.com"
  fill_in "Password",     with: "foobar"
  fill_in "Confirm Password", with: "foobar"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_welcome_message do |username|
  match do |page|
    expect(page).to have_selector('div.alert.alert-success', text: "Welcome #{username}!")
  end
end