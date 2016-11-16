case ENV['BROWSER']
  when 'chrome'
    browser = Watir::Browser.new :chrome
  when 'firefox'
    browser = Watir::Browser.new :firefox
end