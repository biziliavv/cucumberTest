require 'watir-webdriver'
require 'cucumber'



Given(/^user opens Products tab$/) do
  @browser = Watir::Browser.new :chrome
  @browser.goto "http://testdemo.easyerp.com/#easyErp/Products/list"
end

When(/^user sorts the products on left menu$/) do
  sleep(5)
  @browser.a(:id => "sortBy").visible?
  @browser.a(:id => "sortBy").click
  sleep(3)
  @browser.span(:text => "Name").click
  sleep(3)
  @browser.span(:text => "Name").click
  sleep(3)
  @browser.quit
end

When(/^user clicks on New button to create new product$/) do
  Watir::Wait.until { @browser.title == "PRODUCTS" }
  @browser.a(:id => "top-bar-createBtn").click
end


When(/^user enters Product name "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "product").exists?
  @browser.text_field(:id => "product").set "#{arg}"
end


When(/^user uploads the picture$/) do
  @browser.file_field(:id, 'inputImg').set "/home/michael/sorticon.png"
  sleep(5)
  @browser.span(:text => "Crop").click
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
  sleep(5)
  Watir::Wait.until { @browser.li(:text => /IT services/).visible? }
  @browser.li(:text => /IT services/).exists?
end


When (/^user selects product for bundle$/) do
  @browser.li(:text => /IT services/).visible?
  @browser.li(:text => /IT services/).click
  @browser.div(:text => /IT services/).visible?
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
  sleep(10)
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


When(/^user opens the product for editing$/) do
  Watir::Wait.until { @browser.title == "PRODUCTS" }
  sleep(1)
  @browser.td(:xpath => ".//tr[1]/td[3]").click
end


When(/^user edits product info "([^"]*)"$/) do |arg|
  sleep(5)
  Watir::Wait.until { @browser.text_field(:id => "productName").visible? }
  @browser.text_field(:id => "productName").set "#{arg}"
  @browser.text_field(:id => "SKU").set "#{arg}"
  @browser.text_field(:id => "UPC").set "#{arg}"
  @browser.text_field(:id => "ISBN").set "#{arg}"
  @browser.text_field(:id => "EAN").set "#{arg}"
  @browser.a(:id => "productType").click
  sleep(10)
  @browser.li(:text => /Product Type #3/).click
  sleep(3)
end


When(/^user saves the edited product$/) do
  @browser.a(:id => "saveBtn").click
  sleep(5)
end


Then(/^user checks if all data were edited and saved successfully$/) do
  @browser.text_field(:text => /Test product edited/, :index => 0).visible?
  @browser.text_field(:text => /Test product edited/, :index => 1).visible?
  @browser.text_field(:text => /Test product edited/, :index => 2).visible?
  @browser.text_field(:text => /Test product edited/, :index => 3).visible?
  @browser.text_field(:text => /Test product edited/, :index => 4).visible?
  sleep(5)
  @browser.quit
end


When(/^user checks the product$/) do
  Watir::Wait.until { @browser.title == "PRODUCTS" }
  sleep(10)
  @browser.span(:xpath => ".//*[@id='listTable']/tr[1]/td[1]/label/span").click
end


When(/^user clicks delete button$/) do
  sleep(3)
  @browser.a(:text => "Delete").visible?
  sleep(3)
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


When(/^user clicks on Create button to create new category$/) do
  @browser.span(:text => "Create").click
  sleep(5)
  @browser.span(:text => /Test category/).visible?
  sleep(5)
  @browser.quit
end
