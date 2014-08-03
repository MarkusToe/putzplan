Given /^a user is logged in$/ do
  visit signin_path
  @user = User.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  # Method: Capybara::Node::Actions#fill_in
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  # Method: Capybara::Node::Actions#click_button
  click_button "Sign in"
end

Given /^the user is on the profile page$/ do
  expect(page).to have_title(@user.name)
end

When /^the user asks for activities$/ do
  click_button "Get activities!"
end