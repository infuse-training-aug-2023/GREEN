require_relative "Driver"

class MouseEvents < Driver
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def click(element_selector, element_selector_value)
    begin
      element = @wait.until { @driver.find_element(element_selector, element_selector_value) }
      element.click
      return 1
    rescue => exception
      raise "Element not found: #{exception.message}"
    end
  end

  def select_options(element_selector, element_selector_value, option_element_selector, option_element_selector_value)
    begin
      element = Selenium::WebDriver::Support::Select.new(wait.until { @driver.find_element(element_selector, element_selector_value) })
      element.select_by(option_element_selector, option_element_selector_value)
      return 1
    rescue => exception
      raise "Element not found: #{exception.message}"
    end
  end

  def scroll_to(element_selector, element_selector_value)
    element = @driver.find_element(element_selector, element_selector_value)
    @driver.action.scroll_to(element).perform
  end
end
