require 'watir-webdriver'
require 'cucumber'
require 'minitest/autorun'


Given(/^user opens testdemo$/) do
  firefox_path = File.join(File.absolute_path('/usr/local/bin/', File.dirname(__FILE__)),"geckodriver")
  Selenium::WebDriver::Firefox.driver_path = firefox_path
  @browser = Watir::Browser.new :ff
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
  Watir::Wait.until { @browser.a(:text => "Sign In").visible? }
  @browser.a(:text => "Sign In").click
  Watir::Wait.until { @browser.title == "Custom Dashboard" }

end

When(/^user minimize left menu$/) do

  @browser.div(:xpath => "//div[@class='sidebarToggler']").when_present.click

end