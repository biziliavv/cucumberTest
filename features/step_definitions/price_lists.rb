

Given(/^user opens pricelists tab$/) do
  chromedriver_path = File.join(File.absolute_path('/usr/local/bin/', File.dirname(__FILE__)),"chromedriver")
  Selenium::WebDriver::Firefox.driver_path = chromedriver_path
  @browser = Watir::Browser.new :chrome
  @browser.goto "http://testdemo.easyerp.com/#easyErp/priceLists/list"
end

When(/^user click on New pricelist$/) do
  sleep(4)
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

When(/^user changes currency to "([^"]*)"$/) do |arg|
  @browser.a(:id => "currencyDd").click
  sleep(2)
  @browser.li(:text => "#{arg}")


end

When(/^user chooses "([^"]*)" in supplier cost section$/) do |arg|
  sleep(2)
  @browser.label(:text => "#{arg}").click
end

When(/^user checks all pricelists$/) do
  sleep(2)
  @browser.span(:xpath => ".//th[1]/label/span").click

end

When(/^user click on "([^"]*)" button$/) do |arg|
  @browser.a(:text => "#{arg}").click
end

Then(/^verify that list is empty$/) do
  Watir::Wait.until { !@browser.input(:xpath => "//input[@type='checkbox']").visible? }

end

When(/^user accepts alert$/) do
  @browser.alert.ok
end

When(/^user one pricelist$/) do
  sleep(2)
  @browser.td(:xpath => ".//*[@id='listTable']/tr[1]/td[2]").click
end

When(/^user clicks on price list$/) do
  sleep(2)
  @browser.td(:xpath => ".//*[@id='listTable']/tr[1]/td[2]").click

end