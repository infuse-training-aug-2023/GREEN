require_relative "Driver"

class MouseEvents < Driver
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def click(selector, selector_value)
    begin
      element = @wait.until { @driver.find_element(selector, selector_value) }
      element.click
      return 1
    rescue => exception
      raise "Element not found: #{exception.message}"
    end
  end

  def select_options(selector, selector_value, how, what)
    begin
      element = Selenium::WebDriver::Support::Select.new(wait.until { @driver.find_element(selector, selector_value) })
      element.select_by(how, what)
      return 1
    rescue => exception
      raise "Element not found: #{exception.message}"
    end
  end

  def select_option_from_dropdown(selector, selector_value, attribute_value)
    begin
      dropdown = @driver.find_element(selector, selector_value)
      select_list = Selenium::WebDriver::Support::Select.new(dropdown)
      select_list.options.each do |option|
        if option.attribute("value") == attribute_value.to_s
          option.click
          break
        end
      end
      return 1
    rescue => exception
      raise "Element not found: #{exception.message}"
    end
  end
end
