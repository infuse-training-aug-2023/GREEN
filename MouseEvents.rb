require_relative "Driver"

class MouseEvents < Driver
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def click(selector, value)
    begin
      element = @wait.until { @driver.find_element(selector, value) }
      element.click
      return 1
    rescue => exception
      raise "element not found"
      return -1
    end
  end

  def select_options(selector, value, how, what)
    begin
      element = Selenium::WebDriver::Support::Select.new(wait.until { @driver.find_element(selector, value) })
      element.select_by(how, what)
      return 1
    rescue => exception
      raise "element not found"
      return 1
    end
  end
end
