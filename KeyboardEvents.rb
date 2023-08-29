require_relative "Driver"

class KeyboardEvents < Driver
  def initialize
    super
  end

  def send_keys(selector, value, key_strocks)
    begin
      element = @wait.until { @driver.find_element(selector, value) }
      element.send_keys(key_strocks)
      return 1
    rescue => exception
      raise "element not found"
      return -1
    end
  end
end
