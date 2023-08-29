require_relative "Driver"

class TextEvents
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def get_element(element_selector, element_selector_value)
    begin
      element = @driver.find_element(element_selector, element_selector_value)
      return element
    rescue => exception
      raise "Element not found: #{exception.message}"
    end
  end

  def get_text(element_selector, element_selector_value)
    begin
      element = @wait.until { @driver.find_element(element_selector, element_selector_value) }
      return element.text
    rescue => exception
      raise "Element not found: #{exception.message}"
    end
  end
end
