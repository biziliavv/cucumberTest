require 'watir-webdriver'
require 'cucumber'



Given(/^user opens Purchase Payments tab$/) do
  Selenium::WebDriver::Chrome.driver_path = '/usr/local/bin/chromedriver'
  @browser = Watir::Browser.new :chrome
  @browser.goto "http://testdemo.easyerp.com/#easyErp/purchaseOrders/list"
end
