case ENV['BROWSER']
  when 'chrome'
    @browser = Watir::Browser.new :chrome
    Selenium::WebDriver::Chrome.path = '/usr/local/bin/chromedriver'
  when 'firefox'
    @browser = Watir::Browser.new :firefox
end