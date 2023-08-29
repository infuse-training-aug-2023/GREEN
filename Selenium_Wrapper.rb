require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "./driver/chromedriver.exe"

class SeleniumWrapper
  def initialize
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def set_wait(time_sec)
    if (time_sec.is_a? Integer or time_sec.is_a? Float)
      @wait = Selenium::WebDriver::Wait.new(:timeout => time_sec)
    else
      raise "Invalid timeout value"
    end
  end

  def open_website(site_url)
    @driver.get site_url
  end

  def click(selector, value)
    begin
      element = @driver.find_element(selector, value)
      element.click
      return 1
    rescue => exception
      raise "element not found"
      return -1
    end
  end

  def send_keys(selector, value, key_strocks)
    begin
      element = @driver.find_element(selector, value)
      element.send_keys key_strocks
      return 1
    rescue => exception
      raise "element not found"
      return -1
    end
  end

  def select_options(selector, value, how, what)
    begin
      element = Selenium::WebDriver::Support::Select.new(@driver.find_element(selector, value))
      element.select_by(how, what)
      return 1
    rescue => exception
      raise "element not found"
      return 1
    end
  end

  def get_element(selector, value)
    begin
      element = @driver.find_element(selector, value)
      return element
    rescue => exception
      raise "element not found"
      return nil
    end
  end

  def get_text(selector, value)
    begin
      element = @driver.find_element(selector, value)
      return element.text
    rescue => exception
      raise "element not found"
      return nil
    end
  end

  def quit
    @driver.quit
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
