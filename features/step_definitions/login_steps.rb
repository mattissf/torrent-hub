Given /^user "(.*)" with password "(.*)"$/ do |username, password|
  user = User.make(:username => username)
  user.password = password
  user.save
end

Given /^(?:|I )am logged in$/ do
  Given %[I am on login page]
  And %[user "regular_user" with password "regular_password"]
  When %[I fill in "username" with "regular_user"]
  And %[I fill in "password" with "regular_password"]
  And %[I press "Login"]  
  Then %[I should be on the portal]
end