require 'watir-webdriver'
require 'cucumber'
require 'minitest/autorun'



Given(/^a user goes to Amazon$/) do
  @browser = Watir::Browser.new :chrome
  @browser.goto "www.facebook.com"
end

When(/^they enter login for "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "email").set "#{arg}"
end

When(/^they type password "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "pass").set "#{arg}"
  @browser.send_keys :return
end



Then(/^amazon should return results for "([^"]*)"$/) do |arg|
  @browser.div(:class => "innerWrap").wait_until_present
  page_ob = @browser.input(:placeholder => "Search Facebook").exists?
  assert(page_ob == true)

end