require_relative "driver"

class KeyboardEvents
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def send_keys(element_selector, element_selector_value, input_text)
    begin
      element = @wait.until { @driver.find_element(element_selector, element_selector_value) }
      element.send_keys(input_text)
      return 1
    rescue => exception
      raise "Element not found: #{exception.message}"
    end
  end
end

# dr = Driver.new
# key = KeyboardEvents.new(dr.get_driver, dr.get_wait)
# dr.open_website "http://google.com"
# key.send_keys(:id, "APjFqb", "asfd")
# sleep 5
# dr.quit
