require "selenium-webdriver"
require_relative "Driver"
require_relative "KeyboardEvents"
require_relative "TextEvents"
require_relative "MouseEvents"

Selenium::WebDriver::Chrome::Service.driver_path = "./driver/chromedriver.exe"

class SeleniumWrapper
  attr_accessor :driver

  def initialize
    @driver = Driver.new
    @keyboard_events = KeyboardEvents.new(@driver.get_driver, @driver.get_wait)
    @text_events = TextEvents.new(@driver.get_driver, @driver.get_wait)
    @mouse_events = MouseEvents.new(@driver.get_driver, @driver.get_wait)
  end

  # Driver Events
  def open_website(site_url)
    @driver.open_website site_url
  end

  def set_wait(time_sec)
    @driver.set_wait(time_sec)
  end

  def quit
    @driver.quit
  end

  # Mouse Events
  def click(selector, value)
    @mouse_events.click(selector, value)
  end

  def select_options(selector, value, how, what)
    @mouse_events.select_options(selector, value, how, what)
  end

  def select_option_from_dropdown(selector, value, attribute_value)
    @mouse_events.select_option_from_dropdown(selector, value, attribute_value)
  end

  # Keyboard Events
  def send_keys(selector, value, key_strocks)
    @keyboard_events.send_keys(selector, value, key_strocks)
  end

  # Text Events
  def get_element(selector, value)
    @text_events.get_element(selector, value)
  end

  def get_text(selector, value)
    @text_events.get_text(selector, value)
  end
end

# sl = SeleniumWrapper.new
# sl.open_website("https://testpages.herokuapp.com/styled/basic-html-form-test.html")
# sl.set_wait(10)
# sl.send_keys(:name, "username", "heelo")

# test = sl.get_element(:name, "username")

# print(test.text)

# sleep 5
# sl.quit
