require 'watir-webdriver'
require 'cucumber'
require 'minitest/autorun'


Given(/^user opens products list page$/) do
  firefox_path = File.join(File.absolute_path('/usr/local/bin/', File.dirname(__FILE__)),"geckodriver")
  Selenium::WebDriver::Firefox.driver_path = firefox_path
  @browser = Watir::Browser.new :ff
  @browser.goto "http://testdemo.easyerp.com/#easyErp/Products/list"
end


When(/^user types login "([^"]*)"$/) do |arg|
  Watir::Wait.until { @browser.title == "Login" }
  @browser.text_field(:name => "ulogin").set "#{arg}"
end


When(/^user types pass "([^"]*)"$/) do |arg|
  @browser.text_field(:name => "upass").set "#{arg}"
end


When(/^user selects db from dropdown$/) do
  @browser.span(:class => "selectedDb").click
  @browser.li(:text => "sergey (144.76.56.111)").click
end


When(/^user clicks on signin button$/) do
  Watir::Wait.until { @browser.a(:text => "Sign In").visible? }
  @browser.a(:text => "Sign In").click
end


When(/^user clicks grid icon$/) do
  sleep(5)
  @browser.a(:id => "thumbBtn").visible?
  @browser.a(:id => "thumbBtn").click
  sleep(5)
  @browser.a(:text => "New Product").visible?
end


When(/^user opens New category dialog "([^"]*)"$/) do |arg|
  @browser.a(:text => "New Category").click
  @browser.a(:text => "Main").visible?
  @browser.text_field(:id => "categoryName").set "#{arg}"
end


When(/^user goes to Accounting Settings tab$/) do
  @browser.a(:text => "Accounting Settings").click
  sleep(5)
  @browser.label(:text => "Debit Account").visible?
end


When(/^user selects Accounting Settings/) do
  sleep(10)
  Watir::Wait.until { @browser.a(:id => "debitAccount").visible? }
  @browser.a(:id => "debitAccount").click
  sleep(5)
  Watir::Wait.until { @browser.li(:text => /100000 Fixed Asset Account/).visible? }
  @browser.li(:text => /100000 Fixed Asset Account/).click

  @browser.a(:id => "creditAccount").click
  Watir::Wait.until { @browser.li(:text => /101200 Account Receivable/).visible? }
  @browser.li(:text => /101200 Account Receivable/).click
  sleep(5)

  @browser.a(:id => "taxesAccount").click
  Watir::Wait.until { @browser.li(:text => /101400 Erste USD/).visible? }
  @browser.li(:text => /101400 Erste USD/).click
  sleep(5)

  @browser.a(:id => "bankExpensesAccount").click
  Watir::Wait.until { @browser.li(:text => /101401 Ukrsibbank EUR ThinkMobiles/).visible? }
  @browser.li(:text => /101401 Ukrsibbank EUR ThinkMobiles/).click
  sleep(5)

  @browser.a(:id => "otherIncome").click
  Watir::Wait.until { @browser.li(:text => /101400 Erste USD/).visible? }
  @browser.li(:text => /101401 Erste EUR/).click
  sleep(5)

  @browser.a(:id => "otherLoss").click
  Watir::Wait.until { @browser.li(:text => /101402 Ukrsibbank USD ThinkMobiles/).visible? }
  @browser.li(:text => /101402 Ukrsibbank USD ThinkMobiles/).click
  sleep(5)
end


When(/^user clicks on Create button$/) do
  @browser.span(:text => "Create").click
  sleep(5)
  @browser.span(:text => /Test category/).visible?
  sleep(5)
  @browser.quit
end
