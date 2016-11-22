require 'watir-webdriver'
require 'cucumber'
require 'minitest/autorun'


Given(/^user opens Orders tab$/) do
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
  sleep(1)
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
  @browser.span(:text => "Create").click
  sleep(3)
end
