case ENV['BROWSER']
  when 'chrome'
    Selenium::WebDriver::Chrome::Service.executable_path = '/usr/local/bin/chromedriver'
    @browser = Watir::Browser.new :chrome
  when 'firefox'
    @browser = Watir::Browser.new :firefox
end