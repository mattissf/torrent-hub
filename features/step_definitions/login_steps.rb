Given /^(.*) page$/ do |page|
  login_page = "http://127.0.0.1:3000/#{page}"
  
  visit login_page
end

When /^(.*) clicks (.*)$/ do |user, button|
  fill_in :username, :with => user
  fill_in :password, :with => 1234
  click_button button
end

Then /^the page (.*) is shown$/ do |title|
  response_body.should contain(title)
end