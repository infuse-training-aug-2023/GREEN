require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "./driver/chromedriver.exe"

class SeleniumWrapper
  def initialize
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def set_wait(time_sec)
    if (time_sec.is_a? Integer or time_sec.is_a? Float)
      @wait = Selenium::WebDriver::Wait.new(:timeout => time_sec)
    else
      raise "Invalid timeout value"
    end
  end

  def open_website(site_url)
    @driver.get site_url
  end

  def click(selector, value)
    @driver.find_element(selector, value).click
    sleep 3
  end

  

  def quit
    @driver.quit
  end
end

sl = SeleniumWrapper.new
sl.open_website("http://google.com")
sl.set_wait(10)
sl.set_wait("10")
# sl.click(:id, "APjFqb")
sl.quit
