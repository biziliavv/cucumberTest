require 'watir-webdriver'
require 'cucumber'
require 'minitest/autorun'


Given(/^user opens testdemo$/) do
  @browser = Watir::Browser.new :chrome
  @browser.goto "testdemo.easyerp.com"
end


When(/^user types "([^"]*)"$/) do |arg|
  Watir::Wait.until { @browser.title == "Login" }
  @browser.text_field(:name => "ulogin").set "#{arg}"
end

When(/^user types password "([^"]*)"$/) do |arg|
  @browser.text_field(:name => "upass").set "#{arg}"
end

When(/^user choose db as "([^"]*)"$/) do |arg|
  @browser.span(:class => "selectedDb").click
  @browser.li(:text => "sergey (144.76.56.111)").click

end

When(/^user clicks on sign_in button$/) do
  sleep(3)
  Watir::Wait.until { @browser.a(:text => "Sign In").visible? }
  @browser.a(:text => "Sign In").click

end

When(/^user minimize left menu$/) do
  sleep(5)
  @browser.div(:xpath => "//div[@class='sidebarToggler']").when_present.click
end