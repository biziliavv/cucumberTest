case ENV['BROWSER']
  when 'chrome'
    Selenium::WebDriver::Chrome::Service.executable_path = '/Users/vitaliybizilia/Documents/cucumberTest/chromedriver'
    @browser = Watir::Browser.new :chrome
  when 'firefox'
    @browser = Watir::Browser.new :firefox
    @browser = Selenium::WebDriver::Firefox::Service.executable_path = '/Users/vitaliybizilia/Documents/cucumberTest/geckodriver'
end