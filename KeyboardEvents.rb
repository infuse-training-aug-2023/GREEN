require_relative "Driver"

class KeyboardEvents
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
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

# dr = Driver.new
# key = KeyboardEvents.new(dr.get_driver, dr.get_wait)
# dr.open_website "http://google.com"
# key.send_keys(:id, "APjFqb", "asfd")
# sleep 5
# dr.quit
