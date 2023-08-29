require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "./driver/chromedriver.exe"

class Driver
  attr_accessor :driver
  attr_accessor :wait

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.timeouts.implicit_wait = 5
    @driver.manage.timeouts.page_load = 5
    @wait = Selenium::WebDriver::Wait.new(:timeout => 30)
  end

  def set_wait(time_sec)
    if (time_sec.is_a? Integer or time_sec.is_a? Float)
      @wait = Selenium::WebDriver::Wait.new(:timeout => time_sec)
    else
      raise "Invalid timeout value"
    end
  end

  def open_website(site_url)
    @driver.manage.window.maximize
    @driver.get site_url
  end

  def quit
    @driver.quit
  end

  def get_driver
    return @driver
  end

  def get_wait()
    return @wait
  end
end
