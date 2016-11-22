require 'watir-webdriver'
require 'cucumber'
require 'minitest/autorun'


Given(/^user opens Orders tab$/) do
  Selenium::WebDriver::Chrome.driver_path = '/usr/local/bin/chromedriver'
  @browser = Watir::Browser.new :chrome
  @browser.goto "http://testdemo.easyerp.com/#easyErp/purchaseOrders/list"
end

When(/^user opens New Order dialog$/) do
  sleep(10)
  @browser.a(:id => "top-bar-createBtn").visible?
  @browser.a(:id => "top-bar-createBtn").click
end

When(/^user enters all new order information$/) do
  sleep(5)
  @browser.a(:text => "Cancelled").click
  sleep(30)
  @browser.li(:text => /Pending PO/).visible?
  @browser.li(:text => /Pending PO/).click
  sleep(1)
  @browser.a(:id => "customerDd").click
  sleep(5)
  @browser.li(:text => /Actifile/).visible?
  @browser.li(:text => /Actifile/).click
  sleep(1)
  @browser.input(:id => "orderDate").click
  sleep(1)
  @browser.a(:text => "1").click
  sleep(1)
  @browser.input(:id => "expectDate").click
  sleep(3)
  @browser.a(:text => "28").click
  sleep(3)
  @browser.a(:id => "priceList").click
  sleep(30)
  @browser.li(:text => /PL2/).click
  sleep(1)
  @browser.a(:id => "warehouseDd").click
  sleep(1)
  @browser.li(:text => /Main Warehouse/).click
  sleep(1)
  @browser.a(:id => "currencyDd").click
  sleep(1)
  @browser.li(:text => /USD/).click
  sleep(1)
  @browser.a(:id => "assignedTo").click
  sleep(1)
  @browser.li(:text => /Alex Filchak/).click
  sleep(1)
  @browser.a(:text => /Add an item/).click
  sleep(1)
  @browser.a(:class => "current-selected productsDd").click
  sleep(30)
  @browser.li(:text => /IT services/).click
  sleep(1)
  @browser.textarea(:class => "productDescr").set("Test product description.")
  @browser.a(:class => "current-selected accountDd").click
  sleep(30)
  @browser.li(:text => /101400 Erste USD/).click
  sleep(3)
  @browser.a(:class => "current-selected taxCode").click
  sleep(30)
  @browser.li(:text => /100 test 10%/).click
  @browser.text_field(:id => "quantity").set("9")
  @browser.text_field(:id => "editInput").set("11")
  sleep(3)
  @browser.a(:text => /Add an item/).click
  sleep(1)
  @browser.span(:xpath => ".//tr[2]/td[9]/span").click
  sleep(1)
  @browser.span(:text => "9.90").exists?
  @browser.span(:text => "89.10").exists?
  @browser.span(:text => "9.90", :index => 2).exists?
  @browser.span(:text => "89.10", :index => 2).exists?
  @browser.span(:text => "99.00").exists?
  @browser.span(:text => "Create").click
  sleep(3)
end

When (/^user opens order details page$/) do
  @browser.td(:xpath => ".//*[@id='listTable']/tr[1]/td[2]").click
  sleep(2)
end

When (/^user opens order for editing$/) do
  @browser.button(:id => "editButton").click
  sleep(30)
  @browser.span(:text => "Save").visible?
end

When (/^user changes the order details$/) do
  @browser.a(:id => "assignedTo").click
  sleep(2)
  @browser.li(:text => /Alex Roman/).click
  sleep(1)
  @browser.text_field(:id => "expectedDate").click
  sleep(2)
  @browser.a(:text => "1").click
  sleep(4)
  @browser.text_field(:id => "orderDate").click
  sleep(2)
  @browser.a(:text => "1").click
  sleep(4)
  @browser.a(:id => "account").click
  sleep(30)
  @browser.li(:text => "100000 Fixed Asset Account").click
  sleep(1)
  @browser.a(:id => "priceList").click
  sleep(1)
  @browser.li(:text => /PL1/).click
  sleep(1)
  @browser.a(:id => "currencyDd").click
  sleep(1)
  @browser.li(:text => /EUR/).click
  sleep(1)
  @browser.a(:class => "current-selected productsDd").click
  sleep(1)
  @browser.li(:text => /IT services/).click
  sleep(1)
  @browser.textarea(:class => "productDescr").set("Test product description edited.")
  @browser.a(:class => "current-selected accountDd").click
  @browser.li(:text => /101200 Account Receivable/).click
  sleep(1)
  @browser.text_field(:id => "quantity").set("5")
  @browser.text_field(:id => "editInput").set("7")
  @browser.span(:text => "Save").click
  sleep(10)
end

Then (/^user checks if edited order details were saved successfully$/) do
  @browser.a(:text => "Alex Roman").exists?
  @browser.text_field(:text => "01 Nov").exists?
  @browser.text_field(:text => "01 Nov").exists?
  @browser.a(:text => "100000 Fixed Asset Account").exists?
  @browser.a(:text => "PL1").exists?
  @browser.a(:text => "EUR").exists?
  @browser.a(:text => "IT services").exists?
  @browser.textarea(:text => "Test product description edited.").exists?
  @browser.a(:text => "101200 Account Receivable").exists?
  @browser.text_field(:text => "5").exists?
  @browser.text_field(:text => "7.00").exists?
  @browser.span(:text => "3.50").exists?
  @browser.span(:text => "31.50").exists?
  @browser.span(:class => "closeBtn").click
  sleep(4)
end

When (/^user downloads pdf for order$/) do
  @browser.button(:id => "exportToPdf").click
  sleep(10)
end

When (/^user adds and removes the comment to purchase order$/) do
  @browser.span(:text => "+Add Comment").click
  @browser.textarea(:class => "noteText _noteTextarea").set("Test comment.")
  @browser.a(:text => "Save").click
  sleep(4)
  @browser.div(:text => /Test comment./).visible?
  @browser.a(:class => "editDelNote").click
  sleep(30)
  @browser.alert.ok
  sleep(4)
end



















