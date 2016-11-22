require 'watir-webdriver/window'


Given(/^user goes to orders tab$/) do

  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
  @browser.goto "http://testdemo.easyerp.com/#easyErp/purchaseOrders/list"

end

When(/^user chooses "([^"]*)" as supplier$/) do |arg|
  sleep(2)
  @browser.a(:id => "customerDd").click
  sleep(4)
  @browser.li(:xpath => "//div[id='content']/ul[data-page='1']/li[text()='#Recruitment GmbH']").click
  sleep(2)

end

When(/^user clicks on "([^"]*)"$/) do |arg|
  @browser.a(:text => "#{arg}").click
  sleep(2)
  @browser.a(:class => "current-selected productsDd").click
  sleep(2)
  @browser.li(:text => "Admin Expenses").click
  sleep(2)
end

When(/^user types unit price "([^"]*)"$/) do |arg|
  @browser.input(:id => "editInput").click
  sleep(1)
  @browser.input(:id => "editInput").send_keys("#{arg}")
  sleep(1)

end

When(/^user opens created item from the list$/) do
  sleep(2)
  @browser.td(:xpath => ".//*[@id='listTable']/tr[1]/td[2]").click
  sleep(2)


end

When(/^user click on editing order button$/) do
  sleep(2)
  @browser.button(:class => "editButton btn").click
  sleep(2)
  @browser.button(:class => "receiveInvoice btn").click
  sleep(2)

end


Then(/^verify that invoices tab is opened$/) do
  @browser.h3(text: 'Invoices').wait_until_present
  sleep(2)
  @browser.td(:class => "balance").text.include?("$100.00")
end

When(/^user selects supplier$/) do
  sleep(2)
  @browser.a(:id => "customerDd").click
  sleep(4)
  @browser.lis(:xpath => "//li[@data-level='']").first.click
  sleep(2)
end


When(/^user clicks on approve button$/) do
  sleep(2)
  @browser.button(:class => "btn approve").click
  sleep(2)
end

When(/^user clicks on edit button$/) do
  sleep(4)
  @browser.button(:id => "editButton").click
  sleep(5)
  @browser.input(:id => "due_date").click
  sleep(2)
  @browser.as(:xpath => "//a[@href='#']").first.click
  sleep(5)
  @browser.a(:id => "paymentMethod").click
  sleep(2)
  @browser.lis(:xpath => "//li[@data-level='']").first.click
  sleep(5)
  @browser.span(:text => "Save").click

end

When(/^user clicks on Journal Entry button$/) do
  @browser.button(:id => "viewJournalEntries").click
  sleep(2)
  @browser.h3(text: 'Journal Entry').wait_until_present
end

When(/^user clicks on Download button$/) do
  sleep(2)
  @browser.button(:id => "exportToPdf").click



end


When(/^user clicks on upload button and selects file$/) do
  sleep(2)
  @browser.button(:id => "attachment_file").click
  sleep(2)
    attach_file("PI32.pdf", File.open("/Users/vitaliybizilia/Documents/cucumberTest/features/upload-files/"))

end

When(/^user checks one invoice from the list$/) do
  sleep(2)
  @browser.span(:xpath => "//tr[2]/td[1]/label/span").click

end

When(/^user clicks on edit invoice button$/) do
  sleep(2)
  @browser.button(:id => "editButton").click
  sleep(2)
end


When(/^user changes invoice$/) do
  sleep(5)
  @browser.a(:id => "paymentMethod").click
  sleep(2)
  @browser.lis(:xpath => "//li[@data-level='']").first.click
  sleep(5)
  @browser.input(:id => "due_date").click
  sleep(2)
  @browser.as(:xpath => "//a[@href='#']").first.click
  sleep(2)
end

When(/^user save changes$/) do
  sleep(2)
  @browser.span(:text => "Save").click

end

When(/^user one invoice$/) do
  sleep(2)
  @browser.inputs(:xpath => "//tr[3]/td[1]/label/input").first.click
  sleep(2)
end

When(/^user clicks on "([^"]*)" button$/) do |arg|
  sleep(4)
  @browser.button(:id => "editButton").click
  sleep(3)
  @browser.span(:text => "#{arg}").click
  sleep(1)
end

When(/^user fill in payment info$/) do
  sleep(5)
  @browser.a(:xpath => ".//*[@id='paymentMethod']").click
  sleep(4)
  @browser.lis(:xpath => "//li[@data-level='']").first.click
  sleep(5)
end