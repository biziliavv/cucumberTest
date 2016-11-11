require 'watir-webdriver'
require 'cucumber'
require 'minitest/autorun'


Given(/^user opens testdemo site$/) do
  firefox_path = File.join(File.absolute_path('/usr/local/bin/', File.dirname(__FILE__)),"geckodriver")
  Selenium::WebDriver::Firefox.driver_path = firefox_path
  @browser = Watir::Browser.new :ff
  @browser.goto "http://testdemo.easyerp.com/#easyErp/Products/list"
end


When(/^user enters "([^"]*)"$/) do |arg|
  Watir::Wait.until { @browser.title == "Login" }
  @browser.text_field(:name => "ulogin").set "#{arg}"
end

When(/^user enters password "([^"]*)"$/) do |arg|
  @browser.text_field(:name => "upass").set "#{arg}"
end

When(/^user choose db"([^"]*)"$/) do |arg|
  @browser.span(:class => "selectedDb").click
  @browser.li(:text => "sergey (144.76.56.111)").click
end

When(/^user clicks sign_in button$/) do
  Watir::Wait.until { @browser.a(:text => "Sign In").visible? }
  @browser.a(:text => "Sign In").click
end

When(/^user clicks on New button$/) do
  Watir::Wait.until { @browser.title == "PRODUCTS" }
  @browser.a(:id => "top-bar-createBtn").click
  sleep(10)
end

When(/^user enters Product name "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "product").set "#{arg}"
  sleep(10)
end

When(/^user checks all checkboxes$/) do
  sleep(10)
  @browser.span(:xpath => ".//*[@id='createEmployeeForm']/div/div[2]/div[1]/div[2]/div/div[1]/div[2]/label/label/span").click
  @browser.span(:xpath => ".//*[@id='createEmployeeForm']/div/div[2]/div[1]/div[2]/div/div[1]/div[3]/label/label/span").click
  @browser.span(:xpath => ".//*[@id='createEmployeeForm']/div/div[2]/div[1]/div[2]/div/div[1]/div[4]/label/label/span").click
  sleep(10)
end

When(/^user selects categories$/) do
  @browser.span(:id => "showBtn").click
  sleep(10)
  @browser.span(:xpath => ".//*[@id='productCategories']/li[1]/label/span").click
  sleep(10)
  @browser.span(:id => "showBtn").click
  sleep(10)
end

When(/^user clicks Create button $/) do
  @browser.span(:text => "Create").click
  sleep(60)
end


Then(/^new product is created$/) do
  sleep(60)
  Watir::Wait.until { @browser.td(:xpath => ".//*[@id='listTable']/tr[1]/td[3]").visible? }
  page_ob = @browser.td(:text => "Test product name").exists?
  assert(page_ob == true)
  @browser.quit
end