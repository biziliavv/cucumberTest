require 'selenium-webdriver'

Given(/^user opens pricelists tab$/) do
  @browser = Watir::Browser.new :ff
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
  sleep(4)
  @browser.input(:xpath => "//input[@type='checkbox']").click
end

When(/^user clicks on price list$/) do
  sleep(2)
  @browser.td(:xpath => ".//*[@id='listTable']/tr/td[2]").click

end

Then(/^browser is closing$/) do
  sleep(2)
  @browser.close
end

When(/^user checks one item$/) do
  sleep(2)
  @browser.span(:xpath => ".//*[@id='listTable']/tr/td[1]/label/span").click
end

When(/^user logs in to EasyErp$/) do
  Watir::Wait.until { @browser.title == "Login" }
  @browser.text_field(:name => "ulogin").set "yana.gusti"
  @browser.text_field(:name => "upass").set "thinkmobiles2015"

  @browser.span(:class => "selectedDb").click
  @browser.li(:text => "sergey (144.76.56.111)").click
  sleep(2)
  Watir::Wait.until { @browser.a(:text => "Sign In").visible? }
  @browser.a(:text => "Sign In").click
  sleep(3)
end