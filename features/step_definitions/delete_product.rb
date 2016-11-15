require 'watir-webdriver'
require 'cucumber'
require 'minitest/autorun'


Given(/^user opens products list$/) do
  firefox_path = File.join(File.absolute_path('/usr/local/bin/', File.dirname(__FILE__)),"geckodriver")
  Selenium::WebDriver::Firefox.driver_path = firefox_path
  @browser = Watir::Browser.new :ff
  @browser.goto "http://testdemo.easyerp.com/#easyErp/Products/list"
end

When(/^user enters login "([^"]*)"$/) do |arg|
  Watir::Wait.until { @browser.title == "Login" }
  @browser.text_field(:name => "ulogin").set "#{arg}"
end

When(/^user enters pass "([^"]*)"$/) do |arg|
  @browser.text_field(:name => "upass").set "#{arg}"
end

When(/^user selects db "([^"]*)"$/) do |arg|
  @browser.span(:class => "selectedDb").click
  @browser.li(:text => "sergey (144.76.56.111)").click
end

When(/^user clicks signin button$/) do
  Watir::Wait.until { @browser.a(:text => "Sign In").visible? }
  @browser.a(:text => "Sign In").click
end

When(/^user checks the product$/) do
  Watir::Wait.until { @browser.title == "PRODUCTS" }
  sleep(10)
  @browser.span(:xpath => ".//*[@id='listTable']/tr[1]/td[1]/label/span").click
end

When(/^user clicks delete button$/) do
  Watir::Wait.until { @browser.title == "PRODUCTS" }
  @browser.a(:text => "Delete").visible?
  @browser.a(:id => "top-bar-deleteBtn").click
  sleep(10)
  @browser.alert.ok
  sleep(10)
end

When(/^user checks all products$/) do
  @browser.span(:xpath => ".//th[1]/label/span").click
end

When(/^user deletes all checked products$/) do
  Watir::Wait.until { @browser.title == "PRODUCTS" }
  @browser.a(:text => "Delete").visible?
  @browser.a(:id => "top-bar-deleteBtn").click
  sleep(10)
  @browser.alert.ok
  sleep(10)
  @browser.close
end