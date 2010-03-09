Given /^user "(.*)" with password "(.*)"$/ do |username, password|
  user = User.make(:username => username)
  user.password = password
end