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

When(/^user choose db$/) do
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
end

When(/^user enters Product name "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "product").exists?
  @browser.text_field(:id => "product").set "#{arg}"
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

When(/^user enters product information "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "SKU").set "#{arg}"
  @browser.text_field(:id => "UPC").set "#{arg}"
  @browser.text_field(:id => "ISBN").set "#{arg}"
  @browser.text_field(:id => "EAN").set "#{arg}"
end

When(/^user goes to Stock and Inventory tab$/) do
  @browser.a(:text => "Stock/Inventory").click
  sleep(10)
  Watir::Wait.until { @browser.dt(:text => "Weight").visible? }
  @browser.dt(:text => "Weight").exists?
end

When(/^user enters stock data "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "weight").set "#{arg}"
  @browser.text_field(:id => "mainMinStockLevel").set "#{arg}"
  @browser.text_field(:id => "mainReorder").set "#{arg}"
  @browser.text_field(:id => "mainDefaultLocation").set "#{arg}"
  @browser.text_field(:id => "overMinStockLevel").set "#{arg}"
  @browser.text_field(:id => "overReorder").set "#{arg}"
  @browser.text_field(:id => "overDefaultLocation").set "#{arg}"
end

When (/^user goes to Bundle tab$/) do
  @browser.a(:text => "Bundle").click
  Watir::Wait.until { @browser.label(:text => "Name | SKU").visible? }
  @browser.label(:text => "Name | SKU").exists?
end

When (/^user searches for product "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "searchProducts").set "#{arg}"
  @browser.button(:text => "Search").click
  Watir::Wait.until { @browser.li(:text => /Demo Product/).visible? }
  @browser.li(:text => /Demo Product/).exists?
end

When (/^user selects product for bundle$/) do
  @browser.li(:text => /Demo Product/).visible?
  @browser.li(:text => /Demo Product/).click
  @browser.div(:text => /Demo Product/).visible?
  sleep(1)
end

When (/^user enters number of products for bundle "([^"]*)"$/) do |arg|
  @browser.text_field(:class => "quantity").set "#{arg}"
end

When (/^user removes product for bundle$/) do
  @browser.span(:class => "removeBundle icon-close3").click
  sleep(3)
end

When(/^user goes to Prices tab$/) do
  @browser.a(:text => "Prices").click
  sleep(60)
  Watir::Wait.until { @browser.p(:text => "Breaks and Prices:").visible? }
  @browser.p(:text => "Breaks and Prices:").exists?
end

When(/^user enters prices for 1st price list "([^"]*)"$/) do |arg|
  @browser.text_field(:xpath => ".//dl[1]/div[1]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//dl[2]/div[1]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//dl[3]/div[1]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//dl[4]/div[1]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//dl[5]/div[1]/dd/input").set "#{arg}"

  @browser.text_field(:xpath => ".//dl[1]/div[2]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//dl[2]/div[2]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//dl[3]/div[2]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//dl[4]/div[2]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//dl[5]/div[2]/dd/input").set "#{arg}"
end

When(/^user goes to the next Price list tab$/) do
  @browser.a(:text => "PL2").click
  Watir::Wait.until { @browser.p(:text => "Breaks and Prices:").visible? }
  @browser.p(:text => "Breaks and Prices:").exists?
end

When(/^user enters prices for 2nd price list "([^"]*)"$/) do |arg|
  @browser.text_field(:xpath => ".//*[@id='priceBlock']/div/div[2]/div/dl[1]/div[1]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//*[@id='priceBlock']/div/div[2]/div/dl[2]/div[1]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//*[@id='priceBlock']/div/div[2]/div/dl[3]/div[1]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//*[@id='priceBlock']/div/div[2]/div/dl[4]/div[1]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//*[@id='priceBlock']/div/div[2]/div/dl[5]/div[1]/dd/input").set "#{arg}"

  @browser.text_field(:xpath => ".//*[@id='priceBlock']/div/div[2]/div/dl[1]/div[2]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//*[@id='priceBlock']/div/div[2]/div/dl[2]/div[2]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//*[@id='priceBlock']/div/div[2]/div/dl[3]/div[2]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//*[@id='priceBlock']/div/div[2]/div/dl[4]/div[2]/dd/input").set "#{arg}"
  @browser.text_field(:xpath => ".//*[@id='priceBlock']/div/div[2]/div/dl[5]/div[2]/dd/input").set "#{arg}"
end

When(/^user clicks Create button$/) do
  @browser.span(:text => "Create").click
  sleep(10)
end

Then(/^new product is created$/) do
  sleep(10)
  Watir::Wait.until { @browser.td(:xpath => ".//*[@id='listTable']/tr[1]/td[3]").visible? }
  page_ob = @browser.td(:text => "Test product name").exists?
  assert(page_ob == true)
  @browser.quit
end