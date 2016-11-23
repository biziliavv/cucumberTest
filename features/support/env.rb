require "rubygems"
require "selenium-webdriver"

Selenium::WebDriver::Chrome.driver_path = '/usr/local/bin/chromedriver'

preferences = {
    :download => {
        :prompt_for_download => false,
        :directory_upgrade => true,
        :default_directory => "download_directory"
    }
}
