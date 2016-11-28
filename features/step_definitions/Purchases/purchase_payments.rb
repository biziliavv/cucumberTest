require 'watir-webdriver'
require 'cucumber'
require 'minitest/autorun'


Given(/^user opens Purchase Payments tab$/) do
  Selenium::WebDriver::Chrome.driver_path = '/usr/local/bin/chromedriver'
  @browser = Watir::Browser.new :chrome
  screen_width = @browser.execute_script("return screen.width;")
  screen_height = @browser.execute_script("return screen.height;")
  @browser.driver.manage.window.resize_to(screen_width,screen_height)
  @browser.driver.manage.window.move_to(0,0)
  @browser.goto "http://testdemo.easyerp.com/#easyErp/purchasePayments/list"
end
