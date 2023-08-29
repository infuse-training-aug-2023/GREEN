require "selenium-webdriver"
require_relative "events/Driver"
require_relative "events/KeyboardEvents"
require_relative "events/MouseEvents"
require_relative "events/TextEvents"

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
  def click(element_selector, element_selector_value)
    @mouse_events.click(element_selector, element_selector_value)
  end

  def select_options(element_selector, element_selector_value, option_element_selector, option_element_selector_value)
    @mouse_events.select_options(element_selector, element_selector_value, option_element_selector, option_element_selector_value)
  end

  def scroll_to(element_selector, element_selector_value)
    @mouse_events.scroll_to(element_selector, element_selector_value)
  end

  # Keyboard Events
  def send_keys(element_selector, element_selector_value, input_text)
    @keyboard_events.send_keys(element_selector, element_selector_value, input_text)
  end

  # Text Events
  def get_element(element_selector, element_selector_value)
    @text_events.get_element(element_selector, element_selector_value)
  end

  def get_text(element_selector, element_selector_value)
    @text_events.get_text(element_selector, element_selector_value)
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
