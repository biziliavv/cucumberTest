

Given(/^user opens pricelists tab$/) do
  chromedriver_path = File.join(File.absolute_path('/usr/local/bin/', File.dirname(__FILE__)),"chromedriver")
  Selenium::WebDriver::Firefox.driver_path = chromedriver_path
  @browser = Watir::Browser.new :chrome
  @browser.goto "http://testdemo.easyerp.com/#easyErp/priceLists/list"
end

When(/^user click on New pricelist$/) do
  @browser.a(:id => "top-bar-createBtn").click
  sleep(5)
end

When(/^user fill in to pricelist name "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "priceListName").set "#{arg}"
end


When(/^user fill in to pricelist code "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "priceListCode").set "#{arg}"
end

When(/^user clicks on create button$/) do
  @browser.span(:text => "Create").click
  sleep(5)
end

Then(/^error about empty fields appears$/) do
  Watir::Wait.until { @browser.div(:class => "error").visible? }

end

Then(/^error about empty price list code appears$/) do
  Watir::Wait.until { @browser.div(:text => "Price List Code field can not be empty").visible? }
end