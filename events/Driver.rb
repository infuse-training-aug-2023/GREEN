require "selenium-webdriver"

# Selenium::WebDriver::Chrome::Service.driver_path = "./driver/chromedriver"

class Driver
  attr_accessor :driver
  attr_accessor :wait

  def initialize
    @options = Selenium::WebDriver::Chrome::Options.new
    @options.add_argument("--no-sandbox")
    # @options.add_argument("--disable-gpu")
    @options.add_argument("--headless")
    @options.add_argument("--disable-dev-shm-usage")
    @options.add_argument("window-size=1920,1080")
    # @options.add_argument("--no-sandbox")
    @driver = Selenium::WebDriver.for(:chrome, options: @options)
    # @driver = Selenium::WebDriver.for(:chrome)
    # @driver.manage.timeouts.implicit_wait = 15
    @driver.manage.timeouts.page_load = 15
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
    # print @driver.to_s + "driver\n"
    # @driver.manage.window.resize_to(1920, 1080)
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
