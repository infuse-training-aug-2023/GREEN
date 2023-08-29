class Driver
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def quit
    @driver.quit
  end
end
