case ENV['BROWSER']
  when 'chrome'
    @browser = Selenium::WebDriver::Chrome::Service.executable_path = '/Users/vitaliybizilia/Documents/cucumberTest/chromedriver'

  when 'firefox'
    @browser = Selenium::WebDriver::Firefox::Service.executable_path = '/Users/vitaliybizilia/Documents/cucumberTest/geckodriver'
end